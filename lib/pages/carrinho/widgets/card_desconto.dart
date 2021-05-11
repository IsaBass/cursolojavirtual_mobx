import 'package:cursolojavirtual/pages/carrinho/carrinho_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CardDesconto extends StatelessWidget {
  final CarrinhoMobx _carrinho = GetIt.I<CarrinhoMobx>();
  @override
  Widget build(BuildContext context) {
    ////
    Future<void> validaCupom(String cupom) async {
      print('entrou na validação de desconto');

      var resp = await _carrinho.getCupom(cupom);
      int? perc = resp['percent'];
      if (perc == null) {
        ///
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Cupom Inválido"), backgroundColor: Colors.red),
        );

        GetIt.I<CarrinhoMobx>().atribuirDesconto(0, null);

        ///
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Desconto de $perc% aplicado"),
            backgroundColor: Colors.green));

        GetIt.I<CarrinhoMobx>().atribuirDesconto(perc, cupom);
      }
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text("Cupom de Desconto", textAlign: TextAlign.start),
        leading: Icon(Icons.money_off, color: Colors.grey),
        trailing: Icon(Icons.add_box),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite seu cupom",
              ),
              initialValue: GetIt.I<CarrinhoMobx>().cupomDesconto,
              onFieldSubmitted: (value) async {
                if (value.isNotEmpty) {
                  await validaCupom(value);
                }
              },
              // validator: (value) {
              //   if (value.isNotEmpty && value != null) {
              //     validaCupom(value).then((valid) {
              //       if (valid == false)
              //         return "Cupom inválido";
              //       else
              //         return null;
              //     });
              //   }
              //   return null;
              // },
            ),
          ),
        ],
      ),
    );
  }
}
