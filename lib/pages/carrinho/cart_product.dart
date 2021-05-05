import 'package:cloud_firestore/cloud_firestore.dart';

import '../produtos/product_data.dart';

class CartProduct {
  String cid;
  late String category;
  String pid;
  int quantity;
  String? size;
  late ProductData productData;

  CartProduct({
    required this.cid,
    required this.category,
    required this.pid,
    required this.quantity,
    this.size,
    required this.productData,
  });

  // CartProduct();

  CartProduct.fromDocument(DocumentSnapshot<Map<String, dynamic>> document)
      : cid = document.id,
        category = document.data()!["category"] ?? '',
        pid = document.data()!["pid"] ?? '',
        quantity = document.data()!["quantity"] ?? '',
        size = document.data()!["size"] ?? '';

  void diminuirQuantidade() {
    quantity--;
  }

  void aumentarQuantidade() {
    quantity++;
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "size": size,
      "product": productData.toResumedMap()
    };
  }
}
