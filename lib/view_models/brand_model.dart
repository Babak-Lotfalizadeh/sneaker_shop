import 'package:sneaker_shop/view_models/product_model.dart';

class BrandModel {
  int? id;
  String? name;
  List<ProductModel>? products;

  BrandModel({
    this.id,
    this.name,
    this.products,
  });

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    products = List.from(
        (json['products'] as dynamic).map((e) => ProductModel.fromJson(e)));
  }
}
