import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'signup_screen.dart';
import 'userlog_mobx.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _contSenha = TextEditingController();
  final _contEmail = TextEditingController();
  final userLog = GetIt.I<UserMobx>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text("CRIAR CONTA",
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _contEmail,
              decoration: InputDecoration(
                hintText: 'E-mail',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains('@'))
                  return "E-mail inválido";
                return null;
              },
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _contSenha,
              decoration: InputDecoration(
                hintText: 'Senha',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
              validator: (text) {
                if (text.isEmpty || (text.length < 6)) return "Senha inválida";
                return null;
              },
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text('Esqueci Minha Senha', textAlign: TextAlign.right),
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (_contEmail.text.isEmpty) {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("Insira seu e-mail para recuperação"),
                      backgroundColor: Colors.redAccent,
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    userLog.recoveryPass(_contEmail.text);
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("Confira seu email"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 48.0,
              child: RaisedButton(
                child: Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18.0),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    userLog.signIn(
                        email: _contEmail.text,
                        pass: _contSenha.text,
                        onFail: _onFail,
                        onSucces: _onSucces);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSucces() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário LOGADO com Sucesso"),
      backgroundColor: Colors.blueAccent,
      duration: Duration(milliseconds: 500),
    ));

    Future.delayed(Duration(milliseconds: 500)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao LOGAR Usuário"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
