import 'package:cursolojavirtual/pages/userlog/login_screen.dart';
import 'package:cursolojavirtual/pages/userlog/userlog_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class WUsuarioLogado extends StatelessWidget {
  WUsuarioLogado({
    Key? key,
  }) : super(key: key);

  final UserMobx userLog = GetIt.I<UserMobx>();

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ],
    );
  }
}
