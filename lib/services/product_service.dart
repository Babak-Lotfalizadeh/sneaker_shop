import 'dart:convert';

import 'package:sneaker_shop/view_models/brand_model.dart';

class ProductService {
  final String _dummyJson = '''
  [
    {
      "id":1,"name":"Nike" ,"products": [
        {"id":101,"name": "EPIC-REACT","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":102,"name": "AIR-MAX","price":130.00,"isNew":false, "image":"sneaker_02"},
        {"id":103,"name": "AIR-270","price":150.00,"isNew":false, "image":"sneaker_03"},
        {"id":104,"name": "AIR-FORCE","price":130.00,"isNew":true, "image":"sneaker_04"},
        {"id":105,"name": "Phantom GX Pro FG","price":170.00,"isNew":true, "image":"sneaker_01"}
      ]
    },
 
    {
      "id":2,"name":"Adidas" ,"products": [
        {"id":201,"name": "EQ19","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":202,"name": "LIGHT SHOES","price":130.00,"isNew":true, "image":"sneaker_02"},
        {"id":203,"name": "SUPERSTAR SHOES","price":130.00,"isNew":true, "image":"sneaker_03"}
    ]
    },
 
    { 
      "id":3,"name":"Jordan" ,"products": [
        {"id":301,"name": "Jordan 1","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":302,"name": "Jordan 2","price":130.00,"isNew":true, "image":"sneaker_02"},
        {"id":303,"name": "Jordan 3","price":130.00,"isNew":true, "image":"sneaker_03"}
    ] 
    },
  
  
    {
      "id":4,"name":"Puma" ,"products": [
        {"id":401,"name": "Puma 1","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":402,"name": "Puma 2","price":130.00,"isNew":true, "image":"sneaker_02"},
        {"id":403,"name": "Puma 3","price":130.00,"isNew":true, "image":"sneaker_03"}
      ]
    },
    {
      "id":5,"name":"Skecher" ,"products": [
        {"id":501,"name": "Skecher 1","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":502,"name": "Skecher 2","price":130.00,"isNew":true, "image":"sneaker_02"},
        {"id":503,"name": "Skecher 3","price":130.00,"isNew":true, "image":"sneaker_03"}
      ]
    }
  ]
   ''';

  List<BrandModel> getData() {
    var response = json.decode(_dummyJson) as List<dynamic>;
    return List.from(response.map((e) => BrandModel.fromJson(e)));
  }
}
