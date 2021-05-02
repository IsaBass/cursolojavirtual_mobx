import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'pages/carrinho/carrinho_mobx.dart';
import 'pages/home/home_screen.dart';
import 'pages/userlog/userlog_mobx.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    GetIt.instance.reset();
    GetIt.I.registerSingleton<UserMobx>(new UserMobx());
    GetIt.I
        .registerSingleton<CarrinhoMobx>(new CarrinhoMobx(GetIt.I<UserMobx>()));

    GetIt.I<UserMobx>().loadCurrentUser();

    return MaterialApp(
      title: 'Flutter Loja Roupa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      //home: Logificreen(),
    );
  }
}
