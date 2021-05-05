// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userlog_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserMobx on UserMobxBase, Store {
  Computed<bool> _$estaLogadoComputed;

  @override
  bool get estaLogado =>
      (_$estaLogadoComputed ??= Computed<bool>(() => super.estaLogado,
              name: 'UserMobxBase.estaLogado'))
          .value;

  final _$firebaseUserAtom = Atom(name: 'UserMobxBase.firebaseUser');

  @override
  User get firebaseUser {
    _$firebaseUserAtom.reportRead();
    return super.firebaseUser;
  }

  @override
  set firebaseUser(User value) {
    _$firebaseUserAtom.reportWrite(value, super.firebaseUser, () {
      super.firebaseUser = value;
    });
  }

  final _$userDataAtom = Atom(name: 'UserMobxBase.userData');

  @override
  Map<String, dynamic> get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(Map<String, dynamic> value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'UserMobxBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$signOutAsyncAction = AsyncAction('UserMobxBase.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$loadCurrentUserAsyncAction =
      AsyncAction('UserMobxBase.loadCurrentUser');

  @override
  Future<Null> loadCurrentUser() {
    return _$loadCurrentUserAsyncAction.run(() => super.loadCurrentUser());
  }

  final _$UserMobxBaseActionController = ActionController(name: 'UserMobxBase');

  @override
  void signUp(
      {Map<String, dynamic> userData,
      String pass,
      VoidCallback onSucces,
      VoidCallback onFail}) {
    final _$actionInfo =
        _$UserMobxBaseActionController.startAction(name: 'UserMobxBase.signUp');
    try {
      return super.signUp(
          userData: userData, pass: pass, onSucces: onSucces, onFail: onFail);
    } finally {
      _$UserMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signIn(
      {String email, String pass, VoidCallback onSucces, VoidCallback onFail}) {
    final _$actionInfo =
        _$UserMobxBaseActionController.startAction(name: 'UserMobxBase.signIn');
    try {
      return super
          .signIn(email: email, pass: pass, onSucces: onSucces, onFail: onFail);
    } finally {
      _$UserMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firebaseUser: ${firebaseUser},
userData: ${userData},
isLoading: ${isLoading},
estaLogado: ${estaLogado}
    ''';
  }
}
