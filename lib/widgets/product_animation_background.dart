import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/providers/discover_provider.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/utility/utility.dart';
import 'package:sneaker_shop/view_models/brand_model.dart';
import 'package:sneaker_shop/view_models/product_model.dart';

class ProductAnimationBackground extends StatelessWidget {
  final ProductModel? productModel;
  final BrandModel? brandModel;
  final int index;
  final double maxHeight;
  final double maxWidth;

  const ProductAnimationBackground({
    required this.brandModel,
    required this.productModel,
    required this.index,
    required this.maxWidth,
    required this.maxHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.white,
        );
    var largeTextStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        );

    return Consumer<DiscoverProvider>(
      builder: (context, discoverProvider, child) => Transform.translate(
        offset: discoverProvider.getBackgroundPos(index),
        child: Transform.scale(
          scale: discoverProvider.getScale(index, 0.95),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.003)
              ..rotateX(0.0)
              ..rotateY(
                discoverProvider.getPerspective(index),
              ),
            filterQuality: FilterQuality.low,
            alignment: FractionalOffset.center,
            child: Container(
              width: maxWidth,
              height: maxHeight * 0.8,
              margin: EdgeInsets.only(
                right: maxWidth * 0.15,
              ),
              child: Stack(
                children: [
                  Hero(
                    tag: "${productModel?.name}Background",
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      return Container(
                        width: 200,
                        height: 400,
                        decoration: BoxDecoration(
                          color: productModel?.color != null
                              ? Color(int.parse("${productModel?.color}"))
                              : Colors.blue,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              ScreenValues.paddingLarge,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: productModel?.color != null
                            ? Color(int.parse("${productModel?.color}"))
                            : Colors.blue,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            ScreenValues.paddingLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: ScreenValues.paddingNormal,
                    right: ScreenValues.paddingNormal,
                    child: IconButton(
                      onPressed: () => Utility.dummyClick(context),
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: ScreenValues.paddingNormal,
                    right: ScreenValues.paddingNormal,
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: ScreenValues.paddingLarge * 1.5,
                    left: ScreenValues.paddingLarge,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          brandModel?.name ?? "",
                          style: textStyle,
                        ),
                        const SizedBox(height: ScreenValues.paddingNormal),
                        Text(
                          productModel?.name ?? "",
                          style: largeTextStyle,
                        ),
                        const SizedBox(height: ScreenValues.paddingNormal),
                        Text(
                          "\$${productModel?.price?.toStringAsFixed(2) ?? " "}",
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
