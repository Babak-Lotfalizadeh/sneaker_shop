import 'package:flutter/material.dart';
import 'package:sneaker_shop/view_models/brand_model.dart';
import 'package:sneaker_shop/widgets/more_products_widget.dart';
import 'package:sneaker_shop/widgets/product_list_widget.dart';
import 'package:sneaker_shop/widgets/search_filter_widget.dart';

class BrandProductsWidget extends StatelessWidget {
  final BrandModel? brandModel;

  const BrandProductsWidget({
    required this.brandModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newProducts = brandModel?.products
            ?.where((element) => element.isNew == true)
            .toList() ??
        [];

    return Column(
      children: [
        Expanded(
          flex: 7,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: [
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 3,
                          child: SearchFilterWidget(),
                        ),
                        Expanded(flex: 17, child: SizedBox()),
                      ],
                    ),
                  ),
                  ProductListWidget(
                    brandModel: brandModel,
                  ),
                ],
              );
            },
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
