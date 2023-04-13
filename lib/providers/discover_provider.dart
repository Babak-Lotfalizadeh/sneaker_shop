import 'package:flutter/material.dart';
import 'package:sneaker_shop/services/product_service.dart';
import 'package:sneaker_shop/view_models/brand_model.dart';
import 'package:sneaker_shop/view_models/product_model.dart';

class DiscoverProvider extends ChangeNotifier {
  List<BrandModel> _brands = [];

  List<BrandModel> get brands => _brands;

  final _controller = PageController(viewportFraction: 0.75);

  get controller => _controller;

  double? _currentPageValue = 0.0;

  double? get currentPageValue => _currentPageValue;

  void init() {
    getData();
    controller.addListener(() {
      if (_currentPageValue != controller.page) {
        _currentPageValue = controller.page;
        notifyListeners();
      }
    });
  }

  double getShoeAngle(int index) {
    var pageValue = currentPageValue ?? 0.0;
    var decimalValue = pageValue - pageValue.truncate();
    decimalValue = decimalValue - 1;
    var animationValue = -1.0;
    animationValue = decimalValue;
    bool selected = pageValue >= index;

    return selected ? 0.0 : animationValue;
  }

  Offset getShoePosition(int index) {
    var pageValue = currentPageValue ?? 0.0;
    var nextPoint = index + 1;
    if (pageValue > index && pageValue < nextPoint) {
      var decimalValue = pageValue - pageValue.truncate();
      var dx = decimalValue * -150;
      return Offset(dx, 0.0);
    }
    return Offset(pageValue > index ? -100 : 0.0, 0.0);
  }

  Offset getBackgroundPos(int index) {
    var pageValue = currentPageValue ?? 0.0;
    var nextPoint = index + 1;
    if (pageValue > index && pageValue < nextPoint) {
      var decimalValue = pageValue - pageValue.truncate();
      var dx = decimalValue * -10;
      return Offset(dx, 0.0);
    }
    return Offset(pageValue > index ? -100 : 0.0, 0.0);
  }

  double getScale(int index, double limit) {
    var pageValue = currentPageValue ?? 0.0;
    var nextPoint = index + 1;

    if (pageValue > index && pageValue < nextPoint) {
      var decimalValue = pageValue - pageValue.truncate();
      var dx = (1 - decimalValue);
      return dx < limit ? limit : dx;
    }
    return 1.0;
  }

  double getPerspective(int index) {
    var pageValue = currentPageValue ?? 0.0;
    var nextPoint = index + 1;
    var lastPoint = index - 1;
    if (pageValue > index && pageValue < nextPoint) {
      //go next and leave this card
      var decimalValue = pageValue - pageValue.truncate();
      var dx = decimalValue * -1;
      return dx;
    } else if (pageValue < index && pageValue > lastPoint) {
      //go to last page and leave this card
      var decimalValue = pageValue - pageValue.truncate();
      var dx = decimalValue;
      if (dx > 0.5) {
        return dx = 1 - dx;
      }
      return dx;
    }

    return 0.0;
  }

  void getData() {
    _brands = ProductService().getData();
  }

  List<ProductModel>? products(BrandModel brandModel) =>
      _brands.where((element) => element.id == brandModel.id).first.products;
}
