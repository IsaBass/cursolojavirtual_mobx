import 'package:cloud_firestore_all/cloud_firestore_all.dart';
import '../produtos/product_data.dart';



class CartProduct {
  String cid;
  String category;
  String pid;
  int quantity;
  String size;
  ProductData productData;
  

  CartProduct();

  

  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.id;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
    size = document.data["size"];
  }


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