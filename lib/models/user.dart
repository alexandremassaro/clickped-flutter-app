import 'package:clickped/services/api.dart';

class User {

  final int id;
  final String name;
  final String email;

  User({ this.id, this.name, this.email });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  factory User.fromApiUser(ApiUser apiUser) {
    return User(
      id: apiUser.id,
      name: apiUser.name,
      email: apiUser.email,
    );
  }

  @override
  String toString() {
    return '{ id: ' + this.id.toString() + ', name:' + this.name +', email: ' + this.email + ' }';
  }

}