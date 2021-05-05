import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cursolojavirtual/pages/userlog/userlog_mobx.dart';

class CarrinhoRepository {
  final UserMobx user;

  CarrinhoRepository(this.user);

  //
  Future<String> addCartItem(Map<String, dynamic?> map) async {
    DocumentReference doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser!.uid)
        .collection("cart")
        .add(map);

    // if (doc != null) return doc.id;
    return doc.id;
  }

  Future<void> updateCartItem(String id, Map<String, dynamic> map) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser!.uid)
        .collection("cart")
        .doc(id)
        .update(map);
    return;
  }

  Future<void> deleteCartItem(String id) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser!.uid)
        .collection("cart")
        .doc(id)
        .delete();
    return;
  }

  Future<String> finalizarPedido({
    required List<Map<String, dynamic>> listProdutos,
    required double frete,
    required double totalProds,
    required int descontoPerc,
    required double valorFinal,
  }) async {
    // grava pedido
    DocumentReference refOrder =
        await FirebaseFirestore.instance.collection("orders").add({
      "clientId": user.firebaseUser!.uid,
      "products": listProdutos,
      "shipPrice": frete,
      "productsPrice": totalProds,
      "discount": descontoPerc,
      "totalPrice": valorFinal,
      "status": 1,
      "datahora": DateTime.now()
    });

    // grava num do pedido em registro abaixo do usuario
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser!.uid)
        .collection("orders")
        .doc(refOrder.id)
        .set(
      {"orderId": refOrder.id, "datahora": DateTime.now()},
    );

    // get de docs do carrinho para excluir
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser!.uid)
        .collection("cart")
        .get();

    //exclusao de docs do carrinho
    for (DocumentSnapshot doc in query.docs) {
      await doc.reference.delete();
    }

    //retorna num do carrinho
    return refOrder.id;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCarrinho() async {
    print(
        ' entrou em repository getCarrinho .. o userId = ${user.firebaseUser!.uid}');
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser!.uid)
        .collection("cart")
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getProductDados(
      String category, String productId) async {
    return await FirebaseFirestore.instance
        .collection('products')
        .doc(category)
        .collection('items')
        .doc(productId)
        .get();
    //   .then((s) {
    // p.productData = ProductData.fromDocument(s);
  }
}
