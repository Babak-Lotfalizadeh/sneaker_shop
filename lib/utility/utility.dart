import 'package:flutter/material.dart';

class Utility {
  static dummyClick(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Button Click!'),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
