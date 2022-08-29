import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iti/product/product_mode.dart';

class Api {
  List<ProductModel> products = [];
 Future<List<ProductModel>> getProduct() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((value) {
    value.docs.forEach((element) {
      products.add(ProductModel.fromMap(element.data()));
    });
    }).catchError((e) {
      print(e);
    });
    return products;
  }
}
