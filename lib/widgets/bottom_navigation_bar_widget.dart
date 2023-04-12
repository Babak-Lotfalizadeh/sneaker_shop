import 'package:flutter/material.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/widgets/bottom_navigation_item.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.symmetric(vertical: ScreenValues.paddingLarge),
      child: Row(
        children: const [
          BottomNavigationItem(iconData: Icons.home_outlined, selected: true),
          BottomNavigationItem(iconData: Icons.favorite_border),
          BottomNavigationItem(iconData: Icons.add_home_outlined),
          BottomNavigationItem(iconData: Icons.shopping_cart_outlined),
          BottomNavigationItem(iconData: Icons.person_2_outlined),
        ],
      ),
    );
  }
}
