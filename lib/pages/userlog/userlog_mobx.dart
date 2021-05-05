import '../carrinho/carrinho_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'userlog_mobx.g.dart';

class UserMobx = UserMobxBase with _$UserMobx;

abstract class UserMobxBase with Store {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  User? firebaseUser;

  @observable
  Map<String, dynamic> userData = Map();

  @observable
  bool isLoading = false;

  @computed
  bool get estaLogado => (firebaseUser != null);

/*
  bool isLoggedIn() {
    print(' esta logado firebase? = ${(firebaseUser != null).toString()}' );
    print(' esta logado userDAta? = ${(userData != Map()).toString()}' );
    return (firebaseUser != null);
  } */

  @action
  void signUp(
      {required Map<String, dynamic> userData,
      required String pass,
      required VoidCallback onSucces,
      required VoidCallback onFail}) {
    isLoading = true;

    _auth
        .createUserWithEmailAndPassword(
            email: userData['email'], password: pass)
        .then((user) async {
      firebaseUser = user.user;

      print('UUid = ' + firebaseUser!.uid);
      print('Userdata nome = ' + userData["name"]);

      await _saveUserData(userData);

      onSucces();
      isLoading = false;
    }).catchError((e) {
      onFail();
      isLoading = false;
    });
  }

  @action
  void signIn(
      {required String email,
      required String pass,
      required VoidCallback onSucces,
      required VoidCallback onFail}) {
    isLoading = true;
    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      firebaseUser = user.user;

      await loadCurrentUser();

      onSucces();
      isLoading = false;
    }).catchError((e) {
      print(e);
      onFail();
      isLoading = false;
    });
  }

  @action
  Future<void> signOut() async {
    isLoading = true;
    await _auth.signOut();
    firebaseUser = null;
    userData = Map();
    GetIt.I<CarrinhoMobx>().limpar();
    isLoading = false;
  }

  void recoveryPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser!.uid)
        .set(userData);
  }

  @action
  Future<Null> loadCurrentUser() async {
    if (firebaseUser == null) firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      if (userData["name"] == null) {
        var docUser = await FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseUser!.uid)
            .get();
        userData = docUser.data()!;
        GetIt.I<CarrinhoMobx>().loadCurrentCart(GetIt.I<UserMobx>());
      }
    }
  }
}
