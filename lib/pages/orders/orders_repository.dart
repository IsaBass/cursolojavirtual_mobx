import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersRepository {
  Future<List<Map<String, dynamic>>> getOrders(String userId) async {
    ///
    // List<Map<String, dynamic>> pedidos = List.empty();
    //
    // var numeros = await FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(userId)
    //     .collection("orders")
    //     .get();

    var peds = await FirebaseFirestore.instance
        .collection("orders")
        .where('clientId', isEqualTo: userId)
        .orderBy('datahora', descending: true)
        .get();

    return peds.docs.map((e) => e.data()..['orderId'] = e.id).toList();
  }
}
