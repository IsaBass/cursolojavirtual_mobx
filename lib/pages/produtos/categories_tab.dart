import 'package:cursolojavirtual/pages/produtos/produtos_repository.dart';
import 'package:flutter/material.dart';

import 'widgets/category_tile.dart';

class CategoriesTab extends StatelessWidget {
  final _repository = ProdutosRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: _repository.getCategories(),
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
              tiles: snapshot.data!.map((docc) => CategoryTile(docc)).toList(),
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

Widget esperandoCarregamento(AsyncSnapshot snapshot, Function f) {
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
