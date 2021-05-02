// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoMobx on _CarrinhoMobxBase, Store {
  Computed<int> _$quantItensComputed;

  @override
  int get quantItens =>
      (_$quantItensComputed ??= Computed<int>(() => super.quantItens)).value;
  Computed<double> _$valorFreteComputed;

  @override
  double get valorFrete =>
      (_$valorFreteComputed ??= Computed<double>(() => super.valorFrete)).value;
  Computed<double> _$valorDescComputed;

  @override
  double get valorDesc =>
      (_$valorDescComputed ??= Computed<double>(() => super.valorDesc)).value;
  Computed<double> _$valorFinalComputed;

  @override
  double get valorFinal =>
      (_$valorFinalComputed ??= Computed<double>(() => super.valorFinal)).value;

  final _$freteAtom = Atom(name: '_CarrinhoMobxBase.frete');

  @override
  double get frete {
    _$freteAtom.context.enforceReadPolicy(_$freteAtom);
    _$freteAtom.reportObserved();
    return super.frete;
  }

  @override
  set frete(double value) {
    _$freteAtom.context.conditionallyRunInAction(() {
      super.frete = value;
      _$freteAtom.reportChanged();
    }, _$freteAtom, name: '${_$freteAtom.name}_set');
  }

  final _$descontoPercAtom = Atom(name: '_CarrinhoMobxBase.descontoPerc');

  @override
  int get descontoPerc {
    _$descontoPercAtom.context.enforceReadPolicy(_$descontoPercAtom);
    _$descontoPercAtom.reportObserved();
    return super.descontoPerc;
  }

  @override
  set descontoPerc(int value) {
    _$descontoPercAtom.context.conditionallyRunInAction(() {
      super.descontoPerc = value;
      _$descontoPercAtom.reportChanged();
    }, _$descontoPercAtom, name: '${_$descontoPercAtom.name}_set');
  }

  final _$productsAtom = Atom(name: '_CarrinhoMobxBase.products');

  @override
  ObservableList<CartProduct> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(ObservableList<CartProduct> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_CarrinhoMobxBase.isLoading');

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

  final _$totalProdsAtom = Atom(name: '_CarrinhoMobxBase.totalProds');

  @override
  double get totalProds {
    _$totalProdsAtom.context.enforceReadPolicy(_$totalProdsAtom);
    _$totalProdsAtom.reportObserved();
    return super.totalProds;
  }

  @override
  set totalProds(double value) {
    _$totalProdsAtom.context.conditionallyRunInAction(() {
      super.totalProds = value;
      _$totalProdsAtom.reportChanged();
    }, _$totalProdsAtom, name: '${_$totalProdsAtom.name}_set');
  }

  final _$quantProdsAtom = Atom(name: '_CarrinhoMobxBase.quantProds');

  @override
  int get quantProds {
    _$quantProdsAtom.context.enforceReadPolicy(_$quantProdsAtom);
    _$quantProdsAtom.reportObserved();
    return super.quantProds;
  }

  @override
  set quantProds(int value) {
    _$quantProdsAtom.context.conditionallyRunInAction(() {
      super.quantProds = value;
      _$quantProdsAtom.reportChanged();
    }, _$quantProdsAtom, name: '${_$quantProdsAtom.name}_set');
  }

  final _$addCartItemAsyncAction = AsyncAction('addCartItem');

  @override
  Future<Null> addCartItem(CartProduct cartProduct) {
    return _$addCartItemAsyncAction.run(() => super.addCartItem(cartProduct));
  }

  final _$removeCartItemAsyncAction = AsyncAction('removeCartItem');

  @override
  Future<Null> removeCartItem(CartProduct cartProduct) {
    return _$removeCartItemAsyncAction
        .run(() => super.removeCartItem(cartProduct));
  }

  final _$loadCurrentCartAsyncAction = AsyncAction('loadCurrentCart');

  @override
  Future<Null> loadCurrentCart(UserMobx user) {
    return _$loadCurrentCartAsyncAction.run(() => super.loadCurrentCart(user));
  }

  final _$aumentaQuantidadeAsyncAction = AsyncAction('aumentaQuantidade');

  @override
  Future<Null> aumentaQuantidade(CartProduct cartProduct) {
    return _$aumentaQuantidadeAsyncAction
        .run(() => super.aumentaQuantidade(cartProduct));
  }

  final _$diminuiQuantidadeAsyncAction = AsyncAction('diminuiQuantidade');

  @override
  Future<Null> diminuiQuantidade(CartProduct cartProduct) {
    return _$diminuiQuantidadeAsyncAction
        .run(() => super.diminuiQuantidade(cartProduct));
  }

  final _$finishOrderAsyncAction = AsyncAction('finishOrder');

  @override
  Future<String> finishOrder() {
    return _$finishOrderAsyncAction.run(() => super.finishOrder());
  }

  final _$_CarrinhoMobxBaseActionController =
      ActionController(name: '_CarrinhoMobxBase');

  @override
  void somatorios() {
    final _$actionInfo = _$_CarrinhoMobxBaseActionController.startAction();
    try {
      return super.somatorios();
    } finally {
      _$_CarrinhoMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limpar() {
    final _$actionInfo = _$_CarrinhoMobxBaseActionController.startAction();
    try {
      return super.limpar();
    } finally {
      _$_CarrinhoMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atribuirDesconto(int descPerc, String cupom) {
    final _$actionInfo = _$_CarrinhoMobxBaseActionController.startAction();
    try {
      return super.atribuirDesconto(descPerc, cupom);
    } finally {
      _$_CarrinhoMobxBaseActionController.endAction(_$actionInfo);
    }
  }
}
