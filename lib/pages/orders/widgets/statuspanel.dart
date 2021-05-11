import 'package:flutter/material.dart';

class StatusPanel extends StatelessWidget {
  final int status;

  const StatusPanel({Key? key, required this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('$status Status do pedido:'),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bolinha(1, 'Preparação'),
              linhaDivisao(),
              bolinha(2, 'Transporte'),
              linhaDivisao(),
              bolinha(3, 'Entrega'),
            ],
          ),
        ],
      ),
    );
  }

  Widget bolinha(int numero, String subtitle) {
    Widget conteudo() => status > numero
        ? Icon(
            Icons.check,
            color: Colors.grey[200],
            size: 40,
          )
        : Text(
            numero.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          );

    Color backColor() => numero < status
        ? Colors.green
        : numero == status
            ? Colors.blue
            : Colors.blueGrey[300]!;

    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: backColor(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (numero == status)
                Container(
                  height: 150,
                  width: 150,
                  // color: Colors.pink,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              Center(child: conteudo()),
            ],
          ),
        ),
        Text(subtitle),
      ],
    );
  }

  Widget linhaDivisao() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          width: double.maxFinite,
          color: Colors.grey,
          height: 2,
        ),
      ),
    );
  }
}
