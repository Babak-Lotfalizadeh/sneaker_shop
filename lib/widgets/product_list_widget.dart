import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/providers/discover_provider.dart';
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
    return PageView.builder(
      controller: context.read<DiscoverProvider>().controller,
      itemCount: brandModel?.products?.length ?? 0,
      itemBuilder: (context, index) {
        return ProductAnimationWidget(
          index: index,
          brandModel: brandModel,
          productModel: brandModel?.products?[index],
        );
      },
    );
  }
}
