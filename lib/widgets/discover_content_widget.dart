import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/providers/discover_provider.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/widgets/brand_products_widget.dart';
import 'package:sneaker_shop/widgets/tab_widget.dart';

class DiscoverContentWidget extends StatelessWidget {
  const DiscoverContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DiscoverProvider>(
      builder: (context, discoverProvider, child) => DefaultTabController(
        length: discoverProvider.brands.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Center(
              child: TabBar(
                padding: const EdgeInsets.only(left: ScreenValues.paddingLarge),
                isScrollable: true,
                indicatorColor: Colors.white24,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicator: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black12.withOpacity(0.05),
                      Colors.black12.withOpacity(0.05),
                    ],
                  ),
                ),
                labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                tabs: discoverProvider.brands
                    .map((element) => TabWidget(element.name ?? ""))
                    .toList(),
              ),
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: discoverProvider.brands
                .map((e) => BrandProductsWidget(products: e.products))
                .toList(),
          ),
        ),
      ),
    );
  }
}
