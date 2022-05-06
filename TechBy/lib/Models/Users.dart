import 'dart:io';

import 'package:flutter/material.dart';

class User {
  late List<File> Image;
  String firstname, lastname, email, location, ImageUrl, password, doc;
  bool isApproved;

  User(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.location,
      required this.ImageUrl,
      required this.password,
      this.doc = "",
      this.isApproved = false});

  static User fromJson(Map<String, dynamic> data) {
    return User(
        //needed to be set
        firstname: data['firstname'],
        lastname: data['lastname'],
        email: data['email'],
        location: data['location'],
        ImageUrl: data['ImageUrl'],
        password: data['password'],
        isApproved: data['isApproved']);
  }
}
