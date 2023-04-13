import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/providers/discover_provider.dart';
import 'package:sneaker_shop/view_models/product_model.dart';
import 'package:sneaker_shop/widgets/product_image.dart';

class ProductAnimationShoe extends StatefulWidget {
  final ProductModel? productModel;
  final int index;
  final Function(AnimationController controller) onAnimationCreated;

  const ProductAnimationShoe({
    required this.productModel,
    required this.index,
    required this.onAnimationCreated,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductAnimationShoe> createState() => _ProductAnimationShoeState();
}

class _ProductAnimationShoeState extends State<ProductAnimationShoe>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
    value: 1.0,
    lowerBound: 0.5,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  );

  @override
  void initState() {
    super.initState();
    widget.onAnimationCreated.call(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiscoverProvider>(
      builder: (context, discoverProvider, child) => ScaleTransition(
        scale: _animation,
        child: Transform.scale(
          scale: discoverProvider.getScale(widget.index, 0.95),
          child: Transform.translate(
            offset: discoverProvider.getShoePosition(widget.index),
            child: Transform.rotate(
              angle: discoverProvider.getShoeAngle(widget.index),
              child: ProductImage(
                image: widget.productModel?.image ?? "",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
