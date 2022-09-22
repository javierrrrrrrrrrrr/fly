// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

import 'contact_model.dart';

class User {
  User({
    required this.user,
    required this.jwt,
  });

  UserClass user;
  String jwt;

  User copyWith({
    UserClass? user,
    String? jwt,
  }) =>
      User(
        user: user ?? this.user,
        jwt: jwt ?? this.jwt,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        user: UserClass.fromMap(json["user"]),
        jwt: json["jwt"],
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "jwt": jwt,
      };
}

class UserClass {
  UserClass({
    this.email,
    this.id,
    this.role,
    this.userContacts,
    this.isDeleted,
    this.isVerified,
  });

  String? email;
  int? id;
  dynamic role;
  List<Contact>? userContacts;
  bool? isDeleted;
  bool? isVerified;

  UserClass copyWith({
    String? email,
    int? id,
    dynamic role,
    List<Contact>? userContacts,
    bool? isDeleted,
    bool? isVerified,
  }) =>
      UserClass(
        email: email ?? this.email,
        id: id ?? this.id,
        role: role ?? this.role,
        userContacts: userContacts ?? this.userContacts,
        isDeleted: isDeleted ?? this.isDeleted,
        isVerified: isVerified ?? this.isVerified,
      );

  factory UserClass.fromJson(String str) => UserClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserClass.fromMap(Map<String, dynamic> json) => UserClass(
        email: json["email"],
        id: json["id"],
        role: json["role"],
        userContacts: List<Contact>.from(
            json["UserContacts"].map((x) => Contact.fromMap(x))),
        isDeleted: json["isDeleted"],
        isVerified: json["isVerified"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "id": id,
        "role": role,
        "UserContacts": List<Contact>.from(userContacts!.map((x) => x.toMap())),
        "isDeleted": isDeleted,
        "isVerified": isVerified,
      };
}
