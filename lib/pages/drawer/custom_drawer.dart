import '../userlog/login_screen.dart';
import '../userlog/userlog_mobx.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    var userLog = GetIt.I<UserMobx>();
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
              decoration:
                  _boxDecorationGradiente), // container gradiente por baixo, no Stack
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    TituloLojaVirtual(),
                    WUsuarioLogado(userLog: userLog),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Lojas", pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
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
        Colors.blue[500]!,
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}

class WUsuarioLogado extends StatelessWidget {
  const WUsuarioLogado({
    Key? key,
    required this.userLog,
  }) : super(key: key);

  final UserMobx userLog;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      bottom: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Observer(
            builder: (context) {
              print(' logado na tela? = ${(userLog.estaLogado).toString()}');
              return Text(
                'Olá, ${!userLog.estaLogado ? "" : userLog.userData["name"]}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          GestureDetector(
            child: Observer(
                builder: (context) => Text(
                      userLog.estaLogado ? "Sair" : 'Entre ou cadastre-se >',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
            onTap: () {
              if (userLog.estaLogado)
                userLog.signOut();
              else
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class TituloLojaVirtual extends StatelessWidget {
  const TituloLojaVirtual({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.0,
      left: 0.0,
      child: Text(
        "Loja Virtual\nem Flutter",
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Widget cestinha(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: InkWell(
//       child: Row(
//         children: <Widget>[
//           Icon(Icons.shopping_cart),
//           Text(
//             '${GetIt.I<CarrinhoMobx>().quantItens} (${GetIt.I<CarrinhoMobx>().quantProds}) ',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//       onTap: () {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => CartScreen()));
//       },
//     ),
//   );
// }
