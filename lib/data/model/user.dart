import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String imageName;
  String password;
  final String container = 'user';

  User(
      {@required this.firstName,
        this.lastName,
        @required this.phoneNumber,
        this.email,
        this.imageName,
        @required this.password});

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        firstName: map['firstName'],
        lastName: map['lastName'],
        phoneNumber: map['phoneNumber'].toString(),
        email: map['email'],
        imageName: map['imageName'],
        password: map['password']);
  }

  Map<String, dynamic> toJSON() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'imageName': imageName,
      'password': password,
      'container': container
    };
  }

  bool isValid() {
    if (firstName == null || phoneNumber == null || password == null)
      return false;
    else if (firstName.length < 2 ||
        phoneNumber.length != 10 ||
        password.length < 6)
      return false;
    else
      return true;
  }
  String getUserName(){
    if(lastName==null) return firstName;
    else return '$firstName $lastName';
  }
  String get getPhoneNumber => '+251 $phoneNumber';
}
