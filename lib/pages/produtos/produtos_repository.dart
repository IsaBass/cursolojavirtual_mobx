import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutosRepository {
  //
  Future<List<Map<String, dynamic>>> getCategories() async {
    var resp = await FirebaseFirestore.instance.collection("products").get();

    return resp.docs.map((e) => e.data()..['id'] = e.id).toList();
  }

  //
  Future<List<Map<String, dynamic>>> getProdutosCateg(String idCateg) async {
    //
    var resp = await FirebaseFirestore.instance
        .collection('products')
        .doc(idCateg) // categ  clicado = blusa, calça, etc
        .collection('items')
        .get();
    //
    return resp.docs
        .map(
          (e) => e.data()
            ..['id'] = e.id
            ..['category'] = idCateg,
        )
        .toList();
  }
  //
}
