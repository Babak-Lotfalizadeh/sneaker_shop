import 'package:flutter/material.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/utility/utility.dart';
import 'package:sneaker_shop/view_models/product_model.dart';
import 'package:sneaker_shop/widgets/new_product_card.dart';

class MoreProductWidget extends StatelessWidget {
  final List<ProductModel> products;

  const MoreProductWidget({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.grey.shade300,
              ],
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(ScreenValues.paddingLarge),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "More",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Utility.dummyClick(context),
                    child: const Icon(Icons.arrow_right_alt),
                  ),
                ],
              ),
              const SizedBox(height: ScreenValues.paddingLarge),
              Expanded(
                child: Row(
                  children: [
                    NewProductCard(productModel: products.first),
                    const SizedBox(width: ScreenValues.paddingLarge),
                    NewProductCard(productModel: products.last),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
