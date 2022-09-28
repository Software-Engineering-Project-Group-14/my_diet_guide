import 'package:flutter/material.dart';

class User {
  String user_id;
  final String firstName;
  final String lastName;
  final String email;
  final String birthday;

  User({
    this.user_id='',
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthday
  });

  Map<String, dynamic> toJson() => {
    'first name' : firstName,
    'last name': lastName,
    'email': email,
    'birthday' : birthday
  };

  static User fromJson(Map<String, dynamic> json) => User(
    user_id: json['user_id'],
    firstName: json['first name'],
    lastName: json['last name'],
    email: json['email'],
    birthday: json['birthday']
  );
}