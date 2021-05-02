import 'package:cloud_firestore_all/cloud_firestore_all.dart';
import 'package:cursolojavirtual/pages/shared/cestinha_widget.dart';
import 'package:flutter/material.dart';

import 'product_data.dart';
import 'product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snap;

  CategoryScreen(this.snap);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snap.data['title']),
          centerTitle: true,
          actions: <Widget>[Cestinha()],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: firestoreInstance
              .collection('products')
              .document(snap.id) // categ  clicado = blusa, calça, etc
              .collection('items')
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            else
              return TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  GridView.builder(
                    padding: EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        tipo: "grid",
                        category: snap.id,
                        dados:
                            ProductData.fromDocument(snapshot.data.docs[index]),
                      );
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        tipo: 'list',
                        category: snap.id,
                        dados:
                            ProductData.fromDocument(snapshot.data.docs[index]),
                      );
                    },
                  ),
                ],
              );
          },
        ),
      ),
    );
  }
}
