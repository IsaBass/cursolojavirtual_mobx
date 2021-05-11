import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '../carrinho_mobx.dart';
import '../cart_product.dart';

class CartTile extends StatefulWidget {
  final CartProduct cartProduct;
  const CartTile({Key? key, required this.cartProduct}) : super(key: key);

  @override
  _CartTileState createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(/* BuildContext context, CartProduct cartProduct */) {
      print('desenhou todo o build content');
      return Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            width: 120.0,
            child: Image.network(
              widget.cartProduct.productData.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.cartProduct.productData.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17.0)),
                  Text('Tamanho ${widget.cartProduct.size}',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 16.0)),
                  Text(
                      'R\$ ${widget.cartProduct.productData.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22.0)),
                  SizedBox(height: 16.0),
                  rowQuantidade(),
                ],
              ),
            ),
          )
        ],
      );
    }

    return Container(
        child: Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      //color: Colors.grey,
      child: //(widget.cartProduct.productData == null)
          //? futureBuilder(/*context, cartProduct*/) :
          buildContent(/*context, cartProduct*/),
    ));
  }

  Row rowQuantidade() {
    var prod = widget.cartProduct;
    var _carrinho = GetIt.I<CarrinhoMobx>();
    return Row(
      children: <Widget>[
        InkWell(
          child: Icon(Icons.remove, color: Colors.blue),
          onTap: () {
            if (prod.quantity == 1) {
              return;
            } else {
              _carrinho.diminuiQuantidade(prod);
            }
          },
        ),
        SizedBox(width: 10.0),
        Text(
          prod.quantity.toString(),
          style: TextStyle(fontSize: 24.0),
        ),
        SizedBox(width: 10.0),
        InkWell(
          child: Icon(Icons.add, color: Colors.blue),
          onTap: () => _carrinho.aumentaQuantidade(prod),
        ),
        Expanded(
          child: InkWell(
            child: Icon(Icons.delete_forever, color: Colors.grey),
            onTap: () => _carrinho.removeCartItem(prod),
          ),
        )
      ],
    );
  }
}
