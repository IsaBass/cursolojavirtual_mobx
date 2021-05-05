import 'package:cursolojavirtual/pages/carrinho/carrinho_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CardSomatorios extends StatelessWidget {
  final VoidCallback buy;

  CardSomatorios(this.buy);
  //
  final CarrinhoMobx carrinho = GetIt.I<CarrinhoMobx>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Resumo do Pedido",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total Produtos:",
                    ),
                    Text(
                      'R\$ ${carrinho.totalProds.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )
                  ]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Entrega:"),
                    Text('R\$ ${carrinho.valorFrete.toStringAsFixed(2)}')
                  ]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Desconto:"),
                    Text('R\$ ${carrinho.valorDesc.toStringAsFixed(2)}'),
                  ]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total FINAL:",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('R\$ ${carrinho.valorFinal.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).primaryColor))
                  ]),
              SizedBox(height: 12.0),
              ElevatedButton(
                child: Text('Finalizar Pedido'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  textStyle: TextStyle(color: Colors.white),
                ),
                onPressed: buy,
              ),
            ],
          ),
        ),
      );
    });
  }
}
