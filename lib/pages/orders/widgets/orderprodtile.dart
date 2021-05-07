import 'package:flutter/material.dart';

class OrderProdTile extends StatelessWidget {
  final dynamic prod;

  const OrderProdTile({Key? key, required this.prod}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double price = prod['product']['price'].toDouble();
    int quant = prod['quantity'].toInt();

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(prod['product']['title'] + '(${prod['size']})'),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(quant.toString() + ' X '),
                Text(price.toStringAsFixed(2)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.centerRight,
                child: Text('= ' + (price * quant).toStringAsFixed(2))),
          ),
        ],
      ),
    );
  }
}
