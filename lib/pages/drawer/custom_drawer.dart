import 'package:flutter/material.dart';

import 'widgets/drawer_tile.dart';
import 'widgets/tituloloja_widget.dart';
import 'widgets/userlogado_widget.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          // container gradiente por baixo de tudo
          Container(decoration: _boxDecorationGradiente),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: TituloLojaVirtual(),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: WUsuarioLogado(),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", 0),
              DrawerTile(Icons.list, "Produtos", 1),
              DrawerTile(Icons.location_on, "Lojas", 2),
              DrawerTile(Icons.playlist_add_check, "Meus Pedidos", 3),
            ],
          ),
        ],
      ),
    );
  }

  final _boxDecorationGradiente = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 203, 236, 241),
        Colors.pink[100]!,
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
