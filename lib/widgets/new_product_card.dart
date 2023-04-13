import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/product_detail_screen.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/utility/utility.dart';
import 'package:sneaker_shop/view_models/brand_model.dart';
import 'package:sneaker_shop/view_models/product_model.dart';
import 'package:sneaker_shop/widgets/product_image.dart';

class NewProductCard extends StatelessWidget {
  final ProductModel productModel;
  final BrandModel? brandModel;

  const NewProductCard({
    required this.productModel,
    required this.brandModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productModel: productModel,
              brandModel: brandModel,
            ),
          ),
        ),
        child: Card(
          elevation: 1,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ProductImage(
                      image: productModel.image,
                      tag: "${productModel.image}New",
                    ),
                  ),
                  Text(productModel.name ?? ""),
                  const SizedBox(
                    height: ScreenValues.paddingNormal,
                  ),
                  Text("\$${productModel.price?.toStringAsFixed(2) ?? " "}"),
                  const SizedBox(
                    height: ScreenValues.paddingLarge,
                    width: double.infinity,
                  ),
                ],
              ),
              Positioned(
                top: ScreenValues.paddingSmall,
                right: ScreenValues.paddingSmall,
                child: InkWell(
                  onTap: () => Utility.dummyClick(context),
                  child: const Icon(
                    Icons.favorite_border,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ScreenValues.paddingLarge,
                      vertical: ScreenValues.paddingSmall,
                    ),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "NEW",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
