import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? image;
  final String? tag;

  const ProductImage({
    required this.image,
    this.tag,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: (tag != null) ? (tag ?? "") : (image ?? ""),
      child: Image.asset("assets/images/${image ?? ""}.png"),
    );
  }
}
