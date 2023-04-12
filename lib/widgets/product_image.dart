import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? image;

  const ProductImage({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image ?? "",
      child: Image.asset("assets/images/${image ?? ""}.png"),
    );
  }
}
