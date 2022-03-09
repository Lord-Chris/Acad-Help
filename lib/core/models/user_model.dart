import 'dart:convert';

class UserModel {
  final String? id;
  final String name;
  final String dob;
  final String email;
  final String password;

  const UserModel({
    this.id,
    required this.name,
    required this.dob,
    required this.email,
    required this.password,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? dob,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dob': dob,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'] ?? '',
      dob: map['dob'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
