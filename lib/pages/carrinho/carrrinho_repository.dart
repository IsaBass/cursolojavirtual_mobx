import 'package:cloud_firestore_all/cloud_firestore_all.dart';
import 'package:cursolojavirtual/pages/userlog/userlog_mobx.dart';

class CarrinhoRepository {
  final UserMobx user;

  CarrinhoRepository(this.user);

  //
  Future<String> addCartItem(Map<String, dynamic> map) async {
    DocumentReference doc = await firestoreInstance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .add(map);

    if (doc != null) return doc.id;
    return null;
  }

  Future<void> updateCartItem(String id, Map<String, dynamic> map) async {
    await firestoreInstance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(id)
        .update(data: map);
    return;
  }

  Future<void> deleteCartItem(String id) async {
    await firestoreInstance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(id)
        .delete();
    return;
  }

  Future<String> finalizarPedido({
    List<Map<String, dynamic>> listProdutos,
    double frete,
    double totalProds,
    int descontoPerc,
    double valorFinal,
  }) async {
    // grava pedido
    DocumentReference refOrder =
        await firestoreInstance.collection("orders").add({
      "clientId": user.firebaseUser.uid,
      "products": listProdutos,
      "shipPrice": frete,
      "productsPrice": totalProds,
      "discount": descontoPerc,
      "totalPrice": valorFinal,
      "status": 1,
      "datahora": DateTime.now()
    });

    // grava num do pedido em registro abaixo do usuario
    await firestoreInstance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("orders")
        .document(refOrder.id)
        .set(
      {"orderId": refOrder.id, "datahora": DateTime.now()},
    );

    // get de docs do carrinho para excluir
    QuerySnapshot query = await firestoreInstance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .getDocuments();

    //exclusao de docs do carrinho
    for (DocumentSnapshot doc in query.docs) {
      await doc.ref.delete();
    }

    //retorna num do carrinho
    return refOrder.id;
  }

  Future<QuerySnapshot> getCarrinho() async {
    print(' entrou em repository getCarrinho .. o userId = ${user.firebaseUser.uid}');
    return await firestoreInstance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .getDocuments();
  }

  Future<DocumentSnapshot> getProductDados(
      String category, String productId) async {
    return await firestoreInstance
        .collection('products')
        .document(category)
        .collection('items')
        .document(productId)
        .get();
    //   .then((s) {
    // p.productData = ProductData.fromDocument(s);
  }
}
