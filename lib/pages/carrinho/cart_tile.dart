import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'carrinho_mobx.dart';
import 'cart_product.dart';

class CartTile extends StatefulWidget {
  final CartProduct cartProduct;

  const CartTile({Key key, this.cartProduct}) : super(key: key);

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
              )),
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
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Icon(Icons.remove, color: Colors.blue),
                        onTap: () {
                          if (widget.cartProduct.quantity == 1) {
                            return;
                          } else {
                            GetIt.I<CarrinhoMobx>()
                                .diminuiQuantidade(widget.cartProduct);
                          }
                        },
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        widget.cartProduct.quantity.toString(),
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(width: 10.0),
                      InkWell(
                        child: Icon(Icons.add, color: Colors.blue),
                        onTap: () => GetIt.I<CarrinhoMobx>()
                            .aumentaQuantidade(widget.cartProduct),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Icon(Icons.delete_forever, color: Colors.grey),
                          onTap: () => GetIt.I<CarrinhoMobx>()
                              .removeCartItem(widget.cartProduct),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    // Widget futureBuilder(/* BuildContext context, CartProduct cartProduct */) {

    //   return FutureBuilder<DocumentSnapshot>(
    //     future: firestoreInstance
    //         .collection('products')
    //         .document(widget.cartProduct.category)
    //         .collection('items')
    //         .document(widget.cartProduct.pid)
    //         .get(),
    //     builder: (context, snapshot) {
    //       print('>>>>> ENTROU NO BUILDER DO FUTUREBUILDER');

    //       if (snapshot.hasData) {
    //         print('>>>>> FUTUREBUILDER :: ATRBUIU O PRODUCTDATA ');
    //         GetIt.I<CarrinhoMobx>().atribuiProductData(
    //             widget.cartProduct, ProductData.fromDocument(snapshot.data));
    //         // widget.cartProduct.productData =
    //         //     ProductData.fromDocument(snapshot.data);
    //         return buildContent(/*context, cartProduct*/);
    //       } else {
    //         return Container(
    //             height: 70.0,
    //             child: CircularProgressIndicator(),
    //             alignment: Alignment.center);
    //       }
    //     },
    //   );
    // }

    return Container(
        child: Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      //color: Colors.grey,
      child: //(widget.cartProduct.productData == null)
          //? futureBuilder(/*context, cartProduct*/) :
          buildContent(/*context, cartProduct*/),
    ));
  }
}
