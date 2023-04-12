import 'package:flutter/material.dart';
import 'package:sneaker_shop/utility/screen_value.dart';

class AppBarIcon extends StatelessWidget {
  final IconData iconData;
  final Function() onClick;

  const AppBarIcon(
    this.iconData, {
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: ScreenValues.paddingSmall,
        ),
        padding: const EdgeInsets.all(ScreenValues.paddingSmall),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white10,
              Colors.grey.shade200,
            ],
          ),
        ),
        child: Icon(iconData),
      ),
    );
  }
}
