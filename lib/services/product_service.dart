import 'dart:convert';

import 'package:sneaker_shop/view_models/brand_model.dart';

class ProductService {
  final String _dummyJson = '''
  [
    {
      "id":1,"name":"Nike" ,"products": [
        {"id":101,"color":"0xff4EC7DE", "name": "EPIC-REACT","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":102,"color":"0xff2A2448", "name": "AIR-MAX","price":130.00,"isNew":false, "image":"sneaker_02"},
        {"id":103,"color":"0xff262D30", "name": "AIR-270","price":150.00,"isNew":false, "image":"sneaker_03"},
        {"id":104,"color":"0xff3A57B1", "name": "AIR-FORCE","price":130.00,"isNew":true, "image":"sneaker_04"},
        {"id":105,"color":"0xff4EC7DE", "name": "Phantom GX Pro FG","price":170.00,"isNew":true, "image":"sneaker_01"}
      ]
    },
 
    {
      "id":2,"name":"Adidas" ,"products": [
        {"id":201,"color":"0xff4EC7DE", "name": "EQ19","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":202,"color":"0xff2A2448", "name": "LIGHT SHOES","price":130.00,"isNew":true, "image":"sneaker_02"},
        {"id":203,"color":"0xff262D30", "name": "SUPERSTAR SHOES","price":130.00,"isNew":true, "image":"sneaker_03"}
    ]
    },
 
    { 
      "id":3,"name":"Jordan" ,"products": [
        {"id":301, "color":"0xff4EC7DE", "name": "Jordan 1","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":302, "color":"0xff2A2448", "name": "Jordan 2","price":130.00,"isNew":true, "image":"sneaker_02"},
        {"id":303, "color":"0xff262D30", "name": "Jordan 3","price":130.00,"isNew":true, "image":"sneaker_03"}
    ] 
    },
  
  
    {
      "id":4,"name":"Puma" ,"products": [
        {"id":401, "color":"0xff4EC7DE", "name": "Puma 1","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":402, "color":"0xff2A2448", "name": "Puma 2","price":130.00,"isNew":true, "image":"sneaker_02"},
        {"id":403, "color":"0xff262D30", "name": "Puma 3","price":130.00,"isNew":true, "image":"sneaker_03"}
      ]
    },
    {
      "id":5,"name":"Skecher" ,"products": [
        {"id":501, "color":"0xff4EC7DE", "name": "Skecher 1","price":130.00,"isNew":false, "image":"sneaker_01"},
        {"id":502, "color":"0xff2A2448", "name": "Skecher 2","price":130.00,"isNew":true, "image":"sneaker_02"},
        {"id":503, "color":"0xff262D30", "name": "Skecher 3","price":130.00,"isNew":true, "image":"sneaker_03"}
      ]
    }
  ]
   ''';

  List<BrandModel> getData() {
    var response = json.decode(_dummyJson) as List<dynamic>;
    return List.from(response.map((e) => BrandModel.fromJson(e)));
  }
}
