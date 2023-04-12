import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String title;

  const TabWidget(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
    );
  }
}
