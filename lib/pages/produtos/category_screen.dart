import 'package:cursolojavirtual/pages/produtos/produtos_repository.dart';
import 'package:cursolojavirtual/pages/shared/cestinha_widget.dart';
import 'package:flutter/material.dart';

import 'modeldata/product_data.dart';
import 'widgets/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final Map<String, dynamic> categ;

  CategoryScreen(this.categ);

  final _repository = ProdutosRepository();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(categ['title']),
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
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _repository.getProdutosCateg(categ['id']),
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
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        tipo: "grid",
                        dados: ProductData.fromMap(snapshot.data![index]),
                      );
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      ProductData prod =
                          ProductData.fromMap((snapshot.data!)[index]);

                      return ProductTile(
                        tipo: 'list',
                        dados: prod,
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
