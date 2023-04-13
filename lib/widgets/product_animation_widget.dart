import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/product_detail_screen.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/utility/utility.dart';
import 'package:sneaker_shop/view_models/brand_model.dart';
import 'package:sneaker_shop/view_models/product_model.dart';
import 'package:sneaker_shop/widgets/product_image.dart';

class ProductAnimationWidget extends StatelessWidget {
  final BrandModel? brandModel;
  final ProductModel productModel;

  const ProductAnimationWidget({
    required this.brandModel,
    required this.productModel,
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailScreen(productModel: productModel),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.8,
              margin: EdgeInsets.only(right: constraints.maxWidth * 0.15),
              decoration: BoxDecoration(
                color: productModel.color != null
                    ? Color(int.parse("${productModel.color}"))
                    : Colors.blue,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    ScreenValues.paddingLarge,
                  ),
                ),
              ),
            ),
            ProductImage(image: productModel.image ?? ""),
            Positioned(
              top: constraints.maxWidth * 0.18,
              right: constraints.maxWidth * 0.15,
              child: IconButton(
                onPressed: () => Utility.dummyClick(context),
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: constraints.maxWidth * 0.15,
              right: constraints.maxWidth * 0.15,
              child: const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: constraints.maxWidth * 0.25,
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
                    productModel.name ?? "",
                    style: largeTextStyle,
                  ),
                  const SizedBox(height: ScreenValues.paddingNormal),
                  Text(
                    "\$${productModel.price?.toStringAsFixed(2) ?? " "}",
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
