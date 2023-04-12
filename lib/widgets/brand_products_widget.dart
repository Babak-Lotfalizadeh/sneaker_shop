import 'package:flutter/material.dart';
import 'package:sneaker_shop/view_models/product_model.dart';
import 'package:sneaker_shop/widgets/more_products_widget.dart';
import 'package:sneaker_shop/widgets/product_list_widget.dart';
import 'package:sneaker_shop/widgets/search_filter_widget.dart';

class BrandProductsWidget extends StatelessWidget {
  final List<ProductModel>? products;

  const BrandProductsWidget({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newProducts =
        products?.where((element) => element.isNew == true).toList() ?? [];

    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: SearchFilterWidget(),
              ),
              Expanded(
                flex: 8,
                child: ProductListWidget(
                  products: products ?? [],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: newProducts.isNotEmpty ? 4 : 0,
          child: MoreProductWidget(
            products: newProducts,
          ),
        ),
      ],
    );
  }
}
