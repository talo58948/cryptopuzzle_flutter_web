import 'package:flutter/material.dart' show required;

class User {
  final String name;
  final String id;
  static const User dflt = User(name: 'Default name', id: 'Default id');
  const User({@required this.name, @required this.id});
}
