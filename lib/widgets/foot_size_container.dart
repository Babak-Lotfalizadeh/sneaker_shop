import 'package:flutter/material.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/utility/utility.dart';

class FootSizeContainer extends StatelessWidget {
  final String title;
  final Widget? child;

  const FootSizeContainer({
    required this.title,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Utility.dummyClick(context),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.25,
        padding: const EdgeInsets.all(ScreenValues.paddingLarge),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            child ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
