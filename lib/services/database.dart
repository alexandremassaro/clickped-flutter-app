import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userProfileCollection = Firestore.instance.collection('userProfiles');

  Future updateUserProfile(String nome, String cpf, String email) async {
    return await userProfileCollection.document(uid).setData({
      'nome' : nome,
      'cpf' : cpf,
      'email' : email,
    });
  }
}