import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'category_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("products").get(),
        builder: (context, snapshot) {
          // switch (snapshot.connectionState) {
          //   case ConnectionState.waiting:
          //   case ConnectionState.none:
          //     return ciculinhoCarregando();
          //   default:
          //     if (snapshot.hasError)
          //       return Text("Erro ao carregar...",
          //           style: TextStyle(color: Colors.red, fontSize: 28.0));
          //     else {
          return esperandoCarregamento(snapshot, () {
            var dividedTiles = ListTile.divideTiles(
              tiles: snapshot.data!.docs
                  .map((docc) => CategoryTile(
                      docc as DocumentSnapshot<Map<String, dynamic>>))
                  .toList(),
              color: Colors.grey[500],
            ).toList();

            return ListView(children: dividedTiles);
          });
        });
  }
}

Widget ciculinhoCarregando() {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      strokeWidth: 5.0,
    ),
  );
}

Widget esperandoCarregamento(
    AsyncSnapshot<QuerySnapshot> snapshot, Function f) {
  switch (snapshot.connectionState) {
    case ConnectionState.waiting:
    case ConnectionState.none:
      return ciculinhoCarregando();
    default:
      if (snapshot.hasError)
        return Text("Erro ao carregar...",
            style: TextStyle(color: Colors.red, fontSize: 28.0));
      else {
        return f();
      }
  }
}
