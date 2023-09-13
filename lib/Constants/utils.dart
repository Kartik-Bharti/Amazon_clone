import 'package:flutter/material.dart';

void showSnackBar(String msg, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg)),
  );
}
