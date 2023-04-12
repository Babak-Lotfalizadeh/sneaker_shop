import 'package:flutter/material.dart';
import 'package:sneaker_shop/view_models/product_model.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductModel> products;

  const ProductListWidget({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
