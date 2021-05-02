import 'package:cloud_firestore_all/cloud_firestore_all.dart';
import '../shared/cestinha_widget.dart';
import '../carrinho/carrinho_mobx.dart';

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  final Firestore firestore = firestoreInstance;

  final CarrinhoMobx carrinho = GetIt.I<CarrinhoMobx>();

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 211, 118, 130),
                Color.fromARGB(255, 253, 181, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            _SliverAppbar(carrinho: carrinho),
            FutureBuilder<QuerySnapshot>(
              future:
                  firestore.collection("home").orderBy("pos").getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                else
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    staggeredTiles: snapshot.data.docs.map((doc) {
                      return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                    }).toList(),
                    children: snapshot.data.docs.map((doc) {
                      return FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: doc.data["image"],
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  );
              },
            ),
          ],
        ),
      ],
    );
  }
}

// class _CircProgress extends StatelessWidget {
//   const _CircProgress({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 100.0,
//         alignment: Alignment.center,
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//         ),
//       ),
//     );
//   }
// }

class _SliverAppbar extends StatelessWidget {
  final CarrinhoMobx carrinho;

  const _SliverAppbar({Key key, this.carrinho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text("Novidades", textAlign: TextAlign.center),
        centerTitle: true,
      ),
      actions: <Widget>[Cestinha()],
    );
  }
}

Widget ciculinhoCarregando() {
  return Container(
    width: 200.0,
    height: 200.0,
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      strokeWidth: 5.0,
    ),
  );
}
