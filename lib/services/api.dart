import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clickped/shared/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

enum ApiAuthenticationStatus{
  initial,
  authenticated,
  failed,
  expired,
  signedOut,
}

class ApiService {

  String _accessToken;
  bool authenticated;
  ApiAuthenticationStatus status = ApiAuthenticationStatus.initial;

  final _controller = StreamController<ApiUser>();

  Stream<ApiUser> get onAuthStateChanged => _controller.stream;

  ApiService() {
    checkSavedLogin();
  }

  Future checkSavedLogin() async {
    await _getSavedToken();
    if (_accessToken != null && _accessToken.trim() != '')
      me();
  }

  void dispose() {
    _controller.close();
  }

  Future _getSavedToken() async {
    _accessToken = await FlutterSecureStorage().read(key: 'accessToken');
  }

  Future<ApiCredentials> _getSavedCredentials() async {
    String email = await FlutterSecureStorage().read(key: 'email');
    String password = await FlutterSecureStorage().read(key: 'password');
    if (email != null && password != null)
      return ApiCredentials(email: email, password: password);
    else
      return null;
  }

  void _saveCredentials(ApiCredentials credentials) async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    storage.write(key: 'accessToken', value: _accessToken);
    storage.write(key: 'email', value: credentials.email);
    storage.write(key: 'password', value: credentials.password);
  }

  void _saveToken() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    storage.write(key: 'accessToken', value: _accessToken);
  }

  void _deleteCredentials() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.deleteAll();
  }

  get _headers {
    return {HttpHeaders.authorizationHeader: 'Bearer ' + _accessToken};
  }

  Future _authenticatedPost ({ String url, body }) async {
    //ApiResponse response = ApiResponse.fromResponse(await post(url, headers: _headers, body: body));
    Response response = await post(url, headers: _headers, body: body);
    dynamic data = getData(response.body);

    if (response.statusCode == 401 && data['status'].toString().toLowerCase() == 'Token is Expired'.toLowerCase()) {
      response = await _refreshAuthentication();
    }

    response = await post(url, headers: _headers, body: body);

    return response;
  }

  Future _refreshAuthentication() async {
    Response response = await post(refreshTokenApiUrl, headers: _headers);
    dynamic data;
    if (response.headers['content-type'] == 'application/json' && getResponseStatus(response.statusCode) == ApiResponseStatus.success) {
      data = getData(response.body);
      if (data['access_token'] != null) {
        _accessToken = data['access_token'];
        _saveToken();
      }
    } else {
      ApiCredentials credentials = await _getSavedCredentials();
      if (credentials != null)
        response = await login(credentials: credentials);
      else {
        _accessToken = '';
        status = ApiAuthenticationStatus.expired;
        _controller.add(null);
      }
    }

    return response;
  }

  Future _unauthenticatedPost ({ String url, var body }) async {
    //return ApiResponse.fromResponse(await post(url, body: body));
    return post(url, body: body);
  }

  Future _authenticatedGet ({ String url, var body }) {
    var headers = {HttpHeaders.authorizationHeader: 'Bearer ' + _accessToken};

    return get(url, headers: headers);
  }

  Future _unauthenticatedGet ({ String url }) {
    return get(url);
  }

  Future me() async {
    Response response = await _authenticatedPost(url: meApiUrl);
    dynamic data = getData(response.body);
    if (getResponseStatus(response.statusCode) == ApiResponseStatus.success) {
      status = ApiAuthenticationStatus.authenticated;
      _controller.add(getUser(data));
    }
    return response;
  }

  Future login({ ApiCredentials credentials }) async {
    Response response = await _unauthenticatedPost(url: loginApiUrl, body: credentials.emailAndPassword);
    dynamic data = getData(response.body);

    if (getResponseStatus(response.statusCode) == ApiResponseStatus.success && data['access_token'] != null) {
      _accessToken = data['access_token'];
      _saveCredentials(credentials);
      return me();
    } else {
      status = ApiAuthenticationStatus.failed;
      _controller.add(null);
      return null;
    }

  }

  Future register({ ApiNewUser newUser }) async {
    Response response = await _authenticatedPost(url: registerApiUrl, body: newUser.newUser);

    if (getResponseStatus(response.statusCode) == ApiResponseStatus.success) {
      return login(credentials: ApiCredentials(email: newUser.email, password: newUser.password));
    }

    return response;
  }

  Future logout() async {
    Response response = await _authenticatedPost(url: logoutApiUrl);

    if (getResponseStatus(response.statusCode) == ApiResponseStatus.success) {
      _accessToken = '';
      _deleteCredentials();
      status = ApiAuthenticationStatus.signedOut;
      _controller.add(null);
    }

    return response;
  }

  Future getCardapio() async {

  }

  Future checkIn() async {
    //Response response = await _authenticatedGet(url: )
  }

  ApiResponseStatus getResponseStatus(int statusCode) {
    if (statusCode <= 200 && statusCode < 300)
      return ApiResponseStatus.success;
//    else if (statusCode == 400 && statusText.toLowerCase() == 'Token is Invalid'.toLowerCase())
//      return ApiResponseStatus.tokenInvalid;
//    else if (statusCode == 401 && statusText.toLowerCase() == 'Token is Expired'.toLowerCase())
//      return ApiResponseStatus.tokenExpired;
//    else if (statusCode == 404 && statusText.toLowerCase() == 'Authorization Token not found'.toLowerCase())
//      return ApiResponseStatus.tokenNotFound;
    else
      return ApiResponseStatus.unknownError;
  }

  getData(String body){
    return jsonDecode(body);
  }

  ApiUser getUser(data) {
    return ApiUser(
      data['id'],
      data['name'],
      data['email'],
      data['cpf'],
      DateTime.parse(data['email_verified_at']),
      DateTime.parse(data['created_at']),
      DateTime.parse(data['updated_at']),
    );
  }

}

class ApiCredentials {
  final String email;
  final String password;

  ApiCredentials( {this.email, this.password} );

  get emailAndPassword {
    return {
      'email': email,
      'password': password
    };
  }
}

class ApiNewUser {
  final String name;
  final String cpf;
  final String email;
  final String password;
  final String confirmation;

  ApiNewUser({this.name, this.cpf, this.email, this.password, this.confirmation});

  get newUser {
    return {
      'name': name,
      'email': email,
      'cpf': cpf,
      'password': password,
      'password_confirmation': confirmation
    };
  }
}

class ApiUser {
  final int id;
  final String name;
  final String email;
  final String cpf;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  ApiUser(this.id, this.name, this.email, this.cpf, this.emailVerifiedAt, this.createdAt, this.updatedAt);
}

enum ApiResponseStatus {
  success,
  tokenInvalid,
  tokenNotFound,
  tokenExpired,
  unknownError
}
