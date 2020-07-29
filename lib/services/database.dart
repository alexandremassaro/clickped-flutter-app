import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String cpf;

  DatabaseService({ this.cpf });

  // collection reference
  final CollectionReference userProfileCollection = Firestore.instance.collection('userProfiles');

  Future updateUserProfile(String nome, String email) async {
    return await userProfileCollection.document(cpf).setData({
      'nome' : nome,
      'email' : email,
    });
  }

  Future<DocumentSnapshot> getUserProfile() async {
    return await userProfileCollection.document(cpf).get();
  }
}