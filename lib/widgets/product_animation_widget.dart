import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/providers/discover_provider.dart';
import 'package:sneaker_shop/screens/product_detail_screen.dart';
import 'package:sneaker_shop/view_models/brand_model.dart';
import 'package:sneaker_shop/view_models/product_model.dart';
import 'package:sneaker_shop/widgets/product_animation_background.dart';
import 'package:sneaker_shop/widgets/product_animation_shoe.dart';

class ProductAnimationWidget extends StatefulWidget {
  final BrandModel? brandModel;
  final ProductModel? productModel;
  final int index;

  const ProductAnimationWidget({
    required this.brandModel,
    required this.productModel,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductAnimationWidget> createState() => _ProductAnimationWidgetState();
}

class _ProductAnimationWidgetState extends State<ProductAnimationWidget> {
  AnimationController? _controller;

  void showProduct() {
    _controller?.reverse().then((value) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            productModel: widget.productModel,
            brandModel: widget.brandModel,
          ),
        ),
      );

      _controller?.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiscoverProvider>(
      builder: (context, discoverProvider, child) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => InkWell(
          onTap: () => showProduct(),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 17,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ProductAnimationBackground(
                      index: widget.index,
                      brandModel: widget.brandModel,
                      maxHeight: constraints.maxHeight,
                      maxWidth: constraints.maxWidth,
                      productModel: widget.productModel,
                    ),
                    ProductAnimationShoe(
                      onAnimationCreated: (controller) {
                        _controller = controller;
                      },
                      productModel: widget.productModel,
                      index: widget.index,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
