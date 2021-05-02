
import '../shared/cestinha_widget.dart';

import '../drawer/custom_drawer.dart';
import '../produtos/categories_tab.dart';
import 'package:flutter/material.dart';

import 'home_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pageControler = PageController();

  @override
  Widget build(BuildContext context) {
    // _pageControler.jumpToPage(page)

    return PageView(
      controller: _pageControler,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageControler),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Produtos'),
            centerTitle: true,
            actions: <Widget>[Cestinha()],
          ),
          drawer: CustomDrawer(_pageControler),
          body: ProductsTab(),
        ),
        buildScaffold('pagina 3', Colors.redAccent),
        buildScaffold('pagina 4', Colors.yellow),
      ],
    );
  }

  Scaffold buildScaffold(String titulo, Color cor) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      drawer: CustomDrawer(_pageControler),
      body: Container(color: cor),
    );
  }
}
