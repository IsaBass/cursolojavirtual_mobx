import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'userlog_mobx.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _contSenha = TextEditingController();
  final _contNome = TextEditingController();
  final _contEmail = TextEditingController();
  final _contEndereco = TextEditingController();

  final userLog = GetIt.I<UserMobx>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Criar Conta'),
        centerTitle: true,
      ),
      body: userLog.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: _contNome,
                    decoration: _inputDecoracao('Nome'),
                    validator: (text) {
                      if (text == null || text.isEmpty) return "Nome Inválido";
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _contEmail,
                    decoration: _inputDecoracao('E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.isEmpty || !text.contains('@'))
                        return "E-mail inválido";
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _contSenha,
                    decoration: _inputDecoracao('Senha'),
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.isEmpty || (text.length < 6))
                        return "Senha inválida";
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: _inputDecoracao('Repita a Senha'),
                    obscureText: true,
                    validator: (text) {
                      if (text == null ||
                          text.isEmpty ||
                          (text.length < 6) ||
                          (text != _contSenha.text)) return "Senha inválida";
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _contEndereco,
                    decoration: _inputDecoracao('Endereço'),
                    validator: (text) {
                      if (text == null || text.isEmpty)
                        return "Endereço Inválido";
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(height: 10.0),
                  SizedBox(
                    height: 48.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Text(
                        'Criar Cadastro',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Map<String, dynamic> usu = {
                            "name": _contNome.text,
                            "email": _contEmail.text,
                            "address": _contEndereco.text
                          };

                          userLog.signUp(
                            userData: usu,
                            pass: _contSenha.text,
                            onFail: _onFail,
                            onSucces: _onSuccess,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Usuário Criado com Sucesso"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Falha ao Criar Usuário"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }

  InputDecoration _inputDecoracao(String hint) {
    return InputDecoration(
      hintText: hint,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
    );
  }
}
