import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cursolojavirtual/pages/orders/widgets/orderprodtile.dart';
import 'package:cursolojavirtual/pages/orders/widgets/statuspanel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderTile extends StatelessWidget {
  final Map<String, dynamic> ped;

  const OrderTile({Key? key, required this.ped}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double vlrTotal = ped['totalPrice'].toDouble();
    double shipPrice = ped['shipPrice'].toDouble();
    double productsPrice = ped['productsPrice'].toDouble();
    double discount = ped['discount'].toDouble();
    DateFormat _dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    String formattedDate =
        _dateFormat.format((ped['datahora'] as Timestamp).toDate());

    return Card(
      child: Container(
        // alignment: Alignment.topLeft,
        // width: double.maxFinite,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Código: ${ped['orderId']}'),
            Row(
              children: [
                Text('Data: $formattedDate'),
                Spacer(),
                Text('Status: ${ped['status']}'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('produtos: R\$ ${productsPrice.toStringAsFixed(2)}'),
                    Text('frete: R\$ ${shipPrice.toStringAsFixed(2)}'),
                    Text('desconto: ${discount.toStringAsFixed(1)}%'),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.fromBorderSide(BorderSide(width: 0.5)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'R\$ ${vlrTotal.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            StatusPanel(status: ped['status'].toInt()),
            if (ped['products'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (ped['products'] as List)
                    .map((prod) => OrderProdTile(prod: prod))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
