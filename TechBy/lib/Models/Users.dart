import 'package:flutter/material.dart';

class User {
  String firstname, lastname, email, location, ImageUrl, password, doc;

  User(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.location,
      required this.ImageUrl,
      required this.password,
      this.doc = ""});
}
