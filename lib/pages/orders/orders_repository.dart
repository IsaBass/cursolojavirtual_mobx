import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersRepository {
  Future<List<Map<String, dynamic>>> getOrders(String userId) async {
    ///
    // List<Map<String, dynamic>> pedidos = List.empty();
    //
    var numeros = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("orders")
        .get();

    return numeros.docs.map((e) => e.data()..['orderId'] = e.id).toList();
    //     .toList()
    //     .asStream();

    // var peds = FirebaseFirestore.instance
    //     .collection("orders")
    //     .where('clientId', isEqualTo: userId)
    //     .orderBy('datahora', descending: true)
    //     .get()
    //     .asStream();

    // return peds.map((event) =>
    //     event.docs.map((e) => e.data()..['orderId'] = e.id).toList());

    // return peds.expand((element) => element.docs.map((e) => e.data()..['orderId'] = e.id) );

    //     .map((e) => e.data()..['orderId'] = e.id)
    //     .toList()
    //     .asStream();
  }

  Stream<Map<String, dynamic>> getPedido(String orderId) {
    var resp = FirebaseFirestore.instance
        .collection("orders")
        .doc(orderId)
        .snapshots();

    return resp.asyncMap((event) => event.data()!..['orderId'] = event.id);
  }
}
