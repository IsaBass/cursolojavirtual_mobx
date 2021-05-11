import 'package:flutter/material.dart';

import '../category_screen.dart';

class CategoryTile extends StatelessWidget {
  final Map<String, dynamic> categ;

  CategoryTile(this.categ);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.cyanAccent,
        backgroundImage: NetworkImage(categ['icon']),
      ),
      title: Text(categ['title']),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(categ)));
      },
    );
  }
}
