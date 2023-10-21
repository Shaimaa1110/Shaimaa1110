// import 'package:flutter/material.dart';
//
// import '../Screens/Cars_Types/Electric_Cars/Electric_Details/items.dart';
//
//
//
//
//
// class Cart with ChangeNotifier {
//   List selectedProducts = [];
//
//   int price=0;
//
//   add(Item Product) {
//     selectedProducts.add(Product);
//     price +=Product.price.round();
//     notifyListeners();
//   }
//
//   delete(Item product) {
//     selectedProducts.remove(product);
//     price -= product.price.round();
//
//     notifyListeners();
//   }
//
// }

import 'package:flutter/material.dart';

import '../Screens/Cars_Types/items.dart';

class Cart with ChangeNotifier {
  List selectedProducts = [];

  int price = 0;

  add(Item Product) {
    selectedProducts.add(Product);
    price += (Product.price * Product.selectedDays).round();
    notifyListeners();
  }

  delete(Item product) {
    selectedProducts.remove(product);
    price -= (product.price * product.selectedDays).round();
    notifyListeners();
  }
}
