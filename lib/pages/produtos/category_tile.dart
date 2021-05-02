import 'package:cloud_firestore_all/cloud_firestore_all.dart';
import 'package:flutter/material.dart';

import 'category_screen.dart';

class CategoryTile extends StatelessWidget {

final DocumentSnapshot snapshot;

CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.cyanAccent,
        backgroundImage: NetworkImage(snapshot.data['icon']),
      ),
      title: Text( snapshot.data['title'] ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.of(context)
        .push( MaterialPageRoute(builder: (context)=>CategoryScreen(snapshot) )
        );
      },

    );
  }
}