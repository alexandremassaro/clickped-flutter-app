import 'dart:async';

import 'package:clickped/models/user.dart';
import 'package:clickped/services/api.dart';

class AuthService {

  static final ApiService _api = ApiService();

  User _userFromJson(Map userData){
    return userData == null ? null : User.fromJson(userData);
  }

  User _userFromApiUser(ApiUser apiUser){
    return apiUser == null ? null : User.fromApiUser(apiUser);
  }

  // auth change user stream
  Stream<User> get user {
    return _api.onAuthStateChanged.map(_userFromApiUser);
  }

  static void dispose() {
    //_auth.dispose();
    _api.dispose();
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String name, String email, String password, String cpf, String passwordConfirmation) async {
    try {
      return await _api.register(newUser: ApiNewUser(name: name, email: email, password: password, cpf: cpf, confirmation: passwordConfirmation));
    } catch(e) {
      print('error in AuthServive.registerWithEmailAndPassword');
      print(e.toString());
      return null;
    }
  }

  // Sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {

    try {
      return await _api.login(credentials: ApiCredentials(email: email, password: password));
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
      return await _api.logout();
    } catch(e) {
      print('error in AuthServive.signOut');
      print(e.toString());
      return null;
    }
  }

}