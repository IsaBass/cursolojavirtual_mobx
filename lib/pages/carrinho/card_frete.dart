import 'package:flutter/material.dart';

class CardFrete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text("Entrega"),
        leading: Icon(Icons.assignment_turned_in, color: Colors.grey),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
