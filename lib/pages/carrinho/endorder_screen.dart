
import 'package:flutter/material.dart';

class EndOrderScreen extends StatelessWidget {
  final String orderId;

  const EndOrderScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        //width: double.maxFinite,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_rounded,
              size: 80,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Pedido Concluído com Sucesso!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Cód: $orderId',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Voltar ao Início'),
            ),
          ],
        ),
      ),
    );
  }
}
