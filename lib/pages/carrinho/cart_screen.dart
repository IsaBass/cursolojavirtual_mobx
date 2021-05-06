import 'package:cursolojavirtual/pages/carrinho/card_desconto.dart';
import '../userlog/login_screen.dart';
import '../userlog/userlog_mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'card_frete.dart';
import 'card_somatorios.dart';
import 'carrinho_mobx.dart';
import 'cart_tile.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CarrinhoMobx meuCarrinho = GetIt.I<CarrinhoMobx>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu carrinho"),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8.0),
            child: Observer(
              builder: (context) => Text(
                  '${meuCarrinho.quantItens} ${meuCarrinho.quantItens == 1 ? "ITEM" : "ITEMS"} '),
            ),
          ),
        ],
      ),
      body: (GetIt.I<UserMobx>().estaLogado && meuCarrinho.isLoading)
          ? Center(child: CircularProgressIndicator())
          : !GetIt.I<UserMobx>().estaLogado
              ? ninguemLogado(context)
              : (meuCarrinho.products.length == 0 ||
                      meuCarrinho.quantItens == 0)
                  ? semProdutos(context)
                  : listaProdutos(context, meuCarrinho),
    );
  }
}

Widget listaProdutos(BuildContext context, CarrinhoMobx meuCarrinho) {
  return ListView(
    children: <Widget>[
      Observer(builder: (context) {
        return Column(
          children: meuCarrinho.products
              .map((product) => CartTile(cartProduct: product))
              .toList(),
        );
      }),
      CardFrete(),
      SizedBox(height: 10.0),
      CardDesconto(),
      CardSomatorios(() async {
        String orderId = await meuCarrinho.finishOrder();
        print('OrderId = $orderId');
        // chamar outra tela de mostrar num do pedido
      }),
    ],
  );
}

Widget ninguemLogado(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.remove_shopping_cart,
          size: 80.0,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(height: 16.0),
        Text(
          "Faça o login para adicionar produtos!",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              textStyle: TextStyle(
                color: Colors.white,
              )),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text("Entrar", style: TextStyle(fontSize: 17.0)),
        ),
      ],
    ),
  );
}

Widget semProdutos(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.shopping_basket,
          size: 80.0,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(height: 16.0),
        Text(
          "Seu carrinho está vazio!",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            // Navigator.of(context)
            //     .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeTab())
            //     , ModalRoute.withName('/'));
          },
          child: Text("Escolher Produtos", style: TextStyle(fontSize: 17.0)),
        ),
      ],
    ),
  );
}
