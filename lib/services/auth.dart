import 'package:clickped/models/user.dart';
import 'package:clickped/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on FirebseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // Sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print('error in AuthServive.signInAnon');
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String email, String password, String cpf, String nome) async {
    try {

      DatabaseService bd = DatabaseService(cpf: cpf);
      final DocumentSnapshot profile = await bd.getUserProfile();

      if (profile.exists) {
        return 'Este CPF já está cadastrado';
      }
      else{
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        UserUpdateInfo info = UserUpdateInfo();
        info.displayName = cpf;
        user.updateProfile(info);
        await user.reload();

        bd.updateUserProfile(nome, email);

        return _userFromFirebaseUser(user);
      }

    } on PlatformException catch(e) {
      return e.code;
    } catch(e) {
      print('error in AuthServive.registerWithEmailAndPassword');
      print(e.toString());
      return null;
    }
  }

  // Sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
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