class ProductModel {
  int? id;
  String? name, image;
  double? price;
  bool? isNew;

  ProductModel({this.id, this.name, this.image, this.price, this.isNew});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    isNew = json['isNew'];
  }
}
