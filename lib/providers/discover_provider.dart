import 'package:flutter/material.dart';
import 'package:sneaker_shop/services/product_service.dart';
import 'package:sneaker_shop/view_models/brand_model.dart';
import 'package:sneaker_shop/view_models/product_model.dart';

class DiscoverProvider extends ChangeNotifier {
  List<BrandModel> _brands = [];

  List<BrandModel> get brands => _brands;

  void init() {
    getData();
  }

  void getData() {
    _brands = ProductService().getData();
  }

  List<ProductModel>? products(BrandModel brandModel) =>
      _brands.where((element) => element.id == brandModel.id).first.products;
}
