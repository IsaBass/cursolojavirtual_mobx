import 'package:cursolojavirtual/pages/home/home_controller.dart';
import 'package:cursolojavirtual/pages/orders/orders_tab.dart';
import 'package:cursolojavirtual/pages/places/places_tab.dart';
import 'package:get_it/get_it.dart';

import '../shared/cestinha_widget.dart';

import '../drawer/custom_drawer.dart';
import '../produtos/categories_tab.dart';
import 'package:flutter/material.dart';

import 'home_tab.dart';

class HomeScreen extends StatelessWidget {
  final _homeController = GetIt.I<HomeController>();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _homeController.pageControler,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Produtos'),
            centerTitle: true,
            actions: <Widget>[Cestinha()],
          ),
          drawer: CustomDrawer(),
          body: CategoriesTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Nossas Lojas'),
            centerTitle: true,
            actions: <Widget>[Cestinha()],
          ),
          drawer: CustomDrawer(),
          body: PlacesTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Meus Pedidos'),
            centerTitle: true,
            actions: <Widget>[Cestinha()],
          ),
          drawer: CustomDrawer(),
          body: OrdersTab(),
        ),
      ],
    );
  }

  Scaffold buildScaffold(String titulo, Color cor) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      drawer: CustomDrawer(),
      body: Container(color: cor),
    );
  }
}
