import 'package:cursolojavirtual/pages/home/home_controller.dart';
import '../shared/cestinha_widget.dart';
import '../carrinho/carrinho_mobx.dart';

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CarrinhoMobx carrinho = GetIt.I<CarrinhoMobx>();
  final HomeController _homeController = GetIt.I<HomeController>();

  @override
  Widget build(BuildContext context) {
    //
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
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _homeController.getPosicoesImages(),
              //firestore.collection("home").orderBy("pos").get(),
              builder: (context, snapshot) {
                return (!snapshot.hasData)
                    ? SliverToBoxAdapter(
                        child: Container(
                          height: 200.0,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      )
                    : SliverStaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        staggeredTiles: snapshot.data!.map(
                          (doc) {
                            return StaggeredTile.count(
                              doc["x"] ?? 1,
                              doc["y"]!.toDouble(),
                            );
                          },
                        ).toList(),
                        children: snapshot.data!.map((doc) {
                          return FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: doc["image"],
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

class _SliverAppbar extends StatelessWidget {
  final CarrinhoMobx carrinho;

  const _SliverAppbar({Key? key, required this.carrinho}) : super(key: key);

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
