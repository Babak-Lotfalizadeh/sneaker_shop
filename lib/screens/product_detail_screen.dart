import 'package:flutter/material.dart';
import 'package:sneaker_shop/utility/utility.dart';
import 'package:sneaker_shop/view_models/brand_model.dart';
import 'package:sneaker_shop/view_models/product_model.dart';
import 'package:sneaker_shop/widgets/product_details_widget.dart';
import 'package:sneaker_shop/widgets/product_image.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel? productModel;
  final BrandModel? brandModel;

  const ProductDetailScreen({
    required this.productModel,
    required this.brandModel,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 1.5),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(
                    MediaQuery.of(context).size.width * 0.1,
                    -(MediaQuery.of(context).size.height * 0.14),
                  ),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Hero(
                      tag: "${widget.productModel?.name}Background",
                      flightShuttleBuilder: (flightContext, animation,
                          flightDirection, fromHeroContext, toHeroContext) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(
                                int.parse("${widget.productModel?.color}")),
                            shape: BoxShape.circle,
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.productModel?.color != null
                              ? Color(
                                  int.parse("${widget.productModel?.color}"))
                              : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06,
                  ),
                  child: ProductImage(image: widget.productModel?.image),
                ),
                SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: kToolbarHeight,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.keyboard_backspace,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.brandModel?.name ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Utility.dummyClick(context),
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FadeTransition(
              opacity: _animation,
              child: SlideTransition(
                position: _offsetAnimation,
                child: ProductDetailsWidget(productModel: widget.productModel),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
