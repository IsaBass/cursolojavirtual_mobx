import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeController {
  final pageControler = PageController();

  Future<List<Map<String, dynamic>>> getPosicoesImages() async {
    var resp = await FirebaseFirestore.instance
        .collection("home")
        .orderBy("pos")
        .get();

    return resp.docs.map((e) => e.data()).toList();
  }
}
