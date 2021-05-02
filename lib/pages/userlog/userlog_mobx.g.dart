// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userlog_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserMobx on UserMobxBase, Store {
  Computed<bool> _$estaLogadoComputed;

  @override
  bool get estaLogado =>
      (_$estaLogadoComputed ??= Computed<bool>(() => super.estaLogado)).value;

  final _$firebaseUserAtom = Atom(name: 'UserMobxBase.firebaseUser');

  @override
  FirebaseUser get firebaseUser {
    _$firebaseUserAtom.context.enforceReadPolicy(_$firebaseUserAtom);
    _$firebaseUserAtom.reportObserved();
    return super.firebaseUser;
  }

  @override
  set firebaseUser(FirebaseUser value) {
    _$firebaseUserAtom.context.conditionallyRunInAction(() {
      super.firebaseUser = value;
      _$firebaseUserAtom.reportChanged();
    }, _$firebaseUserAtom, name: '${_$firebaseUserAtom.name}_set');
  }

  final _$userDataAtom = Atom(name: 'UserMobxBase.userData');

  @override
  Map<String, dynamic> get userData {
    _$userDataAtom.context.enforceReadPolicy(_$userDataAtom);
    _$userDataAtom.reportObserved();
    return super.userData;
  }

  @override
  set userData(Map<String, dynamic> value) {
    _$userDataAtom.context.conditionallyRunInAction(() {
      super.userData = value;
      _$userDataAtom.reportChanged();
    }, _$userDataAtom, name: '${_$userDataAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: 'UserMobxBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$signOutAsyncAction = AsyncAction('signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$loadCurrentUserAsyncAction = AsyncAction('loadCurrentUser');

  @override
  Future<Null> loadCurrentUser() {
    return _$loadCurrentUserAsyncAction.run(() => super.loadCurrentUser());
  }

  final _$UserMobxBaseActionController = ActionController(name: 'UserMobxBase');

  @override
  void signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSucces,
      @required VoidCallback onFail}) {
    final _$actionInfo = _$UserMobxBaseActionController.startAction();
    try {
      return super.signUp(
          userData: userData, pass: pass, onSucces: onSucces, onFail: onFail);
    } finally {
      _$UserMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSucces,
      @required VoidCallback onFail}) {
    final _$actionInfo = _$UserMobxBaseActionController.startAction();
    try {
      return super
          .signIn(email: email, pass: pass, onSucces: onSucces, onFail: onFail);
    } finally {
      _$UserMobxBaseActionController.endAction(_$actionInfo);
    }
  }
}
