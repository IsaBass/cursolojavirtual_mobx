import 'package:flutter_mobx/flutter_mobx.dart';

import '../carrinho/carrinho_mobx.dart';
import '../carrinho/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Cestinha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      child: Row(
        children: <Widget>[
          Icon(Icons.shopping_cart),
          Observer(
            builder: (context) {
              return Text(
                '${GetIt.I<CarrinhoMobx>().quantItens} (${GetIt.I<CarrinhoMobx>().quantProds}) ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              );
            }
          ),
        ],
      ),
      onTap: () {
        GetIt.I<CarrinhoMobx>().somatorios();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CartScreen()));
      },
    ),
  );
  }
}