import 'package:flutter/material.dart';

import '../modeldata/product_data.dart';
import '../product_screen.dart';

class ProductTile extends StatelessWidget {
  final String tipo;
  final ProductData dados;

  ProductTile({required this.tipo, required this.dados});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductScreen(dados)));
      },
      child: Card(
        elevation: 2,
        child: tipo == "grid" ? prodTileColumn(context) : prodTileRow(context),
      ),
    );
  }

  Row prodTileRow(BuildContext context) {
    double altura = 230.0;
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            width: double.maxFinite,
            child: Image.network(
              dados.images[1],
              fit: BoxFit.cover,
              height: altura,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            width: double.maxFinite,
            // height: altura,
            // color: Colors.red[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  dados.title,
                  style: TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'R\$  ${dados.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column prodTileColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 0.8,
          child: Image.network(dados.images[1], fit: BoxFit.cover),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  dados.title,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'R\$  ${dados.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
