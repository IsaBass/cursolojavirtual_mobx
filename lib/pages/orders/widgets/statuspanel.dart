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
              bolinha(1),
              linhaDivisao(),
              bolinha(2),
              linhaDivisao(),
              bolinha(3),
            ],
          ),
        ],
      ),
    );
  }

  Widget bolinha(int numero) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: numero == status ? Colors.green : Colors.blueGrey[300],
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Text(
        numero.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
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
