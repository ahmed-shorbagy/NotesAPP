import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.teal,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(50),
    elevation: 15,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
