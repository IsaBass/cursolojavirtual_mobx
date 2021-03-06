// import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '../carrinho/carrinho_mobx.dart';
import '../carrinho/cart_product.dart';
import '../userlog/login_screen.dart';
import '../userlog/userlog_mobx.dart';
import '../shared/cestinha_widget.dart';

import 'modeldata/product_data.dart';

class ProductScreen extends StatefulWidget {
  final ProductData dados;
  ProductScreen(this.dados);

  @override
  _ProductScreenState createState() => _ProductScreenState(dados);
}

class _ProductScreenState extends State<ProductScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final ProductData dados;

  final userLog = GetIt.I<UserMobx>();
  final carrinho = GetIt.I<CarrinhoMobx>();

  String? size;

  _ProductScreenState(this.dados);

  @override
  Widget build(BuildContext context) {
    final Color corPrimaria = Theme.of(context).primaryColor;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(dados.title),
        centerTitle: true,
        actions: <Widget>[Cestinha()],
      ),
      body: ListView(
        children: <Widget>[
          carrosselImagens(corPrimaria),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(dados.title,
                    maxLines: 3,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500)),
                Text(
                  'R\$ ${dados.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: corPrimaria,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 19.0),
                Text(
                  'Tamanho',
                  style: TextStyle(
                      color: corPrimaria,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                    children: dados.sizes
                        .map((s) => GestureDetector(
                              onTap: () => setState(() => size = s),
                              child: quadradinho(s, corPrimaria),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: corPrimaria,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: size != null
                        ? () {
                            if (userLog.estaLogado) {
                              CartProduct cart = new CartProduct(
                                category: dados.category,
                                cid: '',
                                pid: dados.id,
                                productData: dados,
                                quantity: 1,
                                size: size,
                              );

                              // cart.quantity = 1;
                              // cart.size = size;
                              // cart.productData = dados;
                              // cart.pid = dados.id;
                              // cart.category = widget.category;

                              carrinho.addCartItem(cart);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Produto adicionado ao carrinho"),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 2),
                              ));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            }
                          }
                        : null,
                    child: Text(
                        userLog.estaLogado
                            ? 'Adicionar ao carrinho'
                            : "Entre para Comprar",
                        style: TextStyle(fontSize: 18.0)),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Descri????o',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  dados.description,
                  style: TextStyle(color: corPrimaria, fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget carrosselImagens(Color corPrimaria) {
    return AspectRatio(
      aspectRatio: 1,
      child: CarouselSlider(
        items: dados.images.map((url) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
                // fit: widget.boxFit,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          aspectRatio: 9 / 16,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOutBack,
        ),
        // dotSize: 6.0,
        // dotSpacing: 20.0,
        // dotBgColor: Colors.transparent,
        // dotColor: corPrimaria,
        // autoplay: true,
        // //autoplayDuration: Duration(seconds: 5),
        // animationDuration: Duration(milliseconds: 500), items: [], options: null,
      ),
    );
  }

  Widget quadradinho(String s, Color corPrimaria) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(
            color: s == size ? corPrimaria : Colors.grey[500]!,
            width: 3.0,
          ),
        ),
        width: 50.0,
        alignment: Alignment.center,
        child: Text(s),
      );
}
