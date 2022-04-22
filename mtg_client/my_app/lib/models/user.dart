import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? profilePicture;
  String? name;
  String? email;
  String? location;

  UserModel({
    this.id,
    this.profilePicture,
    this.name,
    this.email,
    this.location,
  });

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
  }

  UserModel copyWith({
    String? id,
    String? profilePicture,
    String? name,
    String? email,
    String? location,
  }) {
    return UserModel(
      id: id ?? this.id,
      profilePicture: profilePicture ?? this.profilePicture,
      name: name ?? this.name,
      email: email ?? this.email,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profilePicture': profilePicture,
      'name': name,
      'email': email,
      'location': location,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      profilePicture: map['profilePicture'],
      name: map['name'],
      email: map['email'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(id: $id, profilePicture: $profilePicture,name: $name, email: $email, location: $location)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}
