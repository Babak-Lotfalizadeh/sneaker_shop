import 'package:flutter/material.dart';
import 'package:sneaker_shop/view_models/brand_model.dart';
import 'package:sneaker_shop/widgets/product_animation_widget.dart';

class ProductListWidget extends StatelessWidget {
  final BrandModel? brandModel;

  const ProductListWidget({
    required this.brandModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(viewportFraction: 0.80),
      children: brandModel?.products
              ?.map((element) => ProductAnimationWidget(
                    brandModel: brandModel,
                    productModel: element,
                  ))
              .toList() ??
          [],
    );
  }
}
