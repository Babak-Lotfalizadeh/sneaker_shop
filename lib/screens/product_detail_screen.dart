import 'package:flutter/material.dart';
import 'package:sneaker_shop/view_models/product_model.dart';
import 'package:sneaker_shop/widgets/product_image.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel? productModel;

  const ProductDetailScreen({
    required this.productModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ProductImage(image: productModel?.image),
      ),
    );
  }
}
