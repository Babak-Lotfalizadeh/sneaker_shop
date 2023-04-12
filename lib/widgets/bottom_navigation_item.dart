import 'package:flutter/material.dart';
import 'package:sneaker_shop/utility/utility.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData iconData;
  final bool selected;

  const BottomNavigationItem({
    Key? key,
    this.selected = false,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Utility.dummyClick(context),
        child: Icon(
          iconData,
          color: selected ? Theme.of(context).primaryColor : Colors.black38,
        ),
      ),
    );
  }
}
