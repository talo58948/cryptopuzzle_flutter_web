import 'package:flutter/material.dart' show required;

class User {
  String name;
  String id;
  static final User dflt = User(name: 'Default name', id: 'Default id');
  User({@required this.name, @required this.id});
}
