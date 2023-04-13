import 'package:flutter/material.dart';
import 'package:sneaker_shop/utility/screen_value.dart';
import 'package:sneaker_shop/utility/utility.dart';
import 'package:sneaker_shop/view_models/product_model.dart';
import 'package:sneaker_shop/widgets/foot_size_container.dart';
import 'package:sneaker_shop/widgets/product_image.dart';

class ProductDetailsWidget extends StatelessWidget {
  final ProductModel? productModel;

  const ProductDetailsWidget({
    required this.productModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var foodSize = ["Try it", "7.5", "8", "9.5"];
    var textStyleLarge = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
        );
    Widget dummyImage(int pos) {
      return Expanded(
        child: InkWell(
          onTap: () => Utility.dummyClick(context),
          child: Container(
            margin: EdgeInsets.only(
              right: pos < 4 ? ScreenValues.paddingNormal : 0,
            ),
            color: Colors.black12,
            child: ProductImage(
              image: "sneaker",
              tag: "non$pos",
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ScreenValues.paddingLarge,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [1, 2, 3, 4].map((e) => dummyImage(e)).toList(),
                  ),
                ),
                const SizedBox(height: ScreenValues.paddingNormal),
                const Divider(height: 1, thickness: 1),
                const SizedBox(height: ScreenValues.paddingLarge),
                Row(
                  children: [
                    Text(
                      productModel?.name ?? "",
                      style: textStyleLarge,
                    ),
                    const Spacer(),
                    Text(
                      "\$${productModel?.price ?? " "}",
                      style: textStyleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: ScreenValues.paddingLarge),
                Expanded(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non quam quis lacus malesuada rutrum vitae a neque. Nam finibus tristique arcu vitae molestie. Vestibulum sed maximus elit. Proin tincidunt nunc ut pharetra laoreet. Vestibulum finibus dui sit amet mauris sagittis, ut pharetra ligula scelerisque. Morbi egestas vitae lectus nec faucibus. Sed finibus fringilla fringilla. Donec eget felis mattis, convallis odio interdum, semper nibh. Nunc vitae ligula in metus vestibulum condimentum nec at velit. Aenean consectetur eros vitae libero elementum porttitor. Cras mollis rhoncus odio, sit amet cursus dui condimentum eget.",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black38,
                        ),
                  ),
                ),
                const SizedBox(height: ScreenValues.paddingLarge),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () => Utility.dummyClick(context),
                    child: Text(
                      "MORE DETAILS",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: ScreenValues.paddingLarge),
                Row(
                  children: [
                    Text(
                      "Size",
                      style: textStyleLarge,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Utility.dummyClick(context),
                      child: Text(
                        "UK",
                        style: textStyleLarge,
                      ),
                    ),
                    const SizedBox(width: ScreenValues.paddingLarge),
                    InkWell(
                      onTap: () => Utility.dummyClick(context),
                      child: Text(
                        "USA",
                        style: textStyleLarge?.copyWith(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: ScreenValues.paddingLarge),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: ScreenValues.paddingLarge),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => FootSizeContainer(
              title: foodSize[index],
              child: foodSize[index] == "Try it"
                  ? const Icon(Icons.document_scanner_outlined)
                  : null,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: ScreenValues.paddingNormal,
            ),
            itemCount: foodSize.length,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.symmetric(
            vertical: ScreenValues.paddingLarge,
          ),
          child: ElevatedButton(
            child: const Text("ADD TO BAG"),
            onPressed: () => Utility.dummyClick(context),
          ),
        ),
      ],
    );
  }
}
