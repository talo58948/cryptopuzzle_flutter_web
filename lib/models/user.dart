import 'package:flutter/material.dart' show required;

class User {
  final String name;
  static const User dflt = User(
    name: 'Default name',
  );
  const User({@required this.name});
  User.fromJson(Map<String, dynamic> json) : name = json['username'];
}
