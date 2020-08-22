import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clickped/models/user.dart';
import 'package:clickped/services/database.dart';
import 'package:clickped/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class AuthService {

  //final FirebaseAuth _auth = FirebaseAuth.instance;
  static final AuthenticationState _auth = AuthenticationState();


  User _userFromJson(Map userData){
    return userData == null ? null : User.fromJson(userData);
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromJson);
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String name, String email, String password, String cpf, String passwordConfirmation) async {
    try {

      Map user = await _auth.register(name, email, cpf, password, passwordConfirmation);
      return User.fromJson(user);

    } catch(e) {
      print('error in AuthServive.registerWithEmailAndPassword');
      print(e.toString());
      return null;
    }
  }

  // Sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      Map user = await _auth.signIn(email, password);
      return _userFromJson(user);
    } on PlatformException catch(e) {
      print(e.code);
      return e.code;
    } catch(e) {
      print('error in AuthServive.signInWithEmailAndPassword');
      print(e.toString());
      return null;
    }
  }

  //TODO: Sign in Google account
  //TODO: Sign in Facebook
  //TODO: Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print('error in AuthServive.signOut');
      print(e.toString());
      return null;
    }
  }
}

enum AuthenticationStatus{
  initial,
  authenticated,
  failed,
  expired,
  signedOut,
}

class AuthenticationState {
  bool authenticated;
  AuthenticationStatus status = AuthenticationStatus.initial;
  String _accessToken = '';
  final _controller = StreamController<Map>();

  Future<Map> register(String name, String email, String cpf, String password, String passwordConfirmation) async {
    try {
      Response jsonResponse = await post(registerApiUrl, body: {'name': name, 'email': email, 'cpf': cpf, 'password': password, 'password_confirmation': passwordConfirmation});

      if (jsonResponse.statusCode >= 200 && jsonResponse.statusCode < 300){
        return signIn(email, password);
      } else {
        authenticated = false;
        status = AuthenticationStatus.failed;
        _controller.add(null);
        throw 'Erro: ' + jsonResponse.statusCode.toString();
      }
    } catch (e) {
      authenticated = false;
      status = AuthenticationStatus.failed;
      _controller.add(null);
      return null;
    }
  }

  Future<Map> signIn(String email, String password) async {
    try {
      Response jsonResponse = await post(loginApiUrl, body: {'email': email, 'password': password});
      Map data = jsonDecode(jsonResponse.body);

      if (jsonResponse.statusCode >= 200 && jsonResponse.statusCode < 300) {
        _accessToken = data['access_token'];

        jsonResponse = await post(meApiUrl, headers: {
          HttpHeaders.authorizationHeader: 'Bearer ' + _accessToken
        });
        print(jsonResponse);
        data = jsonDecode(jsonResponse.body);

        authenticated = true;
        status = AuthenticationStatus.authenticated;
        _controller.add(data);

        return data;
      } else {
        authenticated = false;
        status = AuthenticationStatus.failed;
        _controller.add(null);
        throw 'Erro: ' + jsonResponse.statusCode.toString();
      }
    } catch (e) {
      authenticated = false;
      status = AuthenticationStatus.failed;
      _controller.add(null);
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      Response jsonResponse = await post(logoutApiUrl, headers: {HttpHeaders.authorizationHeader: 'Bearer ' + _accessToken});
      if (jsonResponse.statusCode >= 200 && jsonResponse.statusCode < 300) {
        _accessToken = '';
        authenticated = false;
        status = AuthenticationStatus.signedOut;
        _controller.add(null);
      } else {
        authenticated = false;
        status = AuthenticationStatus.failed;
        _controller.add(null);
        throw 'Erro: ' + jsonResponse.statusCode.toString();
      }
    } catch (e) {
      authenticated = false;
      status = AuthenticationStatus.failed;
      _controller.add(null);
    }
  }

  Stream<Map> get onAuthStateChanged => _controller.stream;

}