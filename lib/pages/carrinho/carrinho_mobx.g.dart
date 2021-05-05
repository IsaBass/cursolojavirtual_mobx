// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoMobx on _CarrinhoMobxBase, Store {
  Computed<int>? _$quantItensComputed;

  @override
  int get quantItens =>
      (_$quantItensComputed ??= Computed<int>(() => super.quantItens,
              name: '_CarrinhoMobxBase.quantItens'))
          .value;
  Computed<double>? _$valorFreteComputed;

  @override
  double get valorFrete =>
      (_$valorFreteComputed ??= Computed<double>(() => super.valorFrete,
              name: '_CarrinhoMobxBase.valorFrete'))
          .value;
  Computed<double>? _$valorDescComputed;

  @override
  double get valorDesc =>
      (_$valorDescComputed ??= Computed<double>(() => super.valorDesc,
              name: '_CarrinhoMobxBase.valorDesc'))
          .value;
  Computed<double>? _$valorFinalComputed;

  @override
  double get valorFinal =>
      (_$valorFinalComputed ??= Computed<double>(() => super.valorFinal,
              name: '_CarrinhoMobxBase.valorFinal'))
          .value;

  final _$freteAtom = Atom(name: '_CarrinhoMobxBase.frete');

  @override
  double get frete {
    _$freteAtom.reportRead();
    return super.frete;
  }

  @override
  set frete(double value) {
    _$freteAtom.reportWrite(value, super.frete, () {
      super.frete = value;
    });
  }

  final _$descontoPercAtom = Atom(name: '_CarrinhoMobxBase.descontoPerc');

  @override
  int get descontoPerc {
    _$descontoPercAtom.reportRead();
    return super.descontoPerc;
  }

  @override
  set descontoPerc(int value) {
    _$descontoPercAtom.reportWrite(value, super.descontoPerc, () {
      super.descontoPerc = value;
    });
  }

  final _$productsAtom = Atom(name: '_CarrinhoMobxBase.products');

  @override
  ObservableList<CartProduct> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<CartProduct> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CarrinhoMobxBase.isLoading');

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

  final _$totalProdsAtom = Atom(name: '_CarrinhoMobxBase.totalProds');

  @override
  double get totalProds {
    _$totalProdsAtom.reportRead();
    return super.totalProds;
  }

  @override
  set totalProds(double value) {
    _$totalProdsAtom.reportWrite(value, super.totalProds, () {
      super.totalProds = value;
    });
  }

  final _$quantProdsAtom = Atom(name: '_CarrinhoMobxBase.quantProds');

  @override
  int get quantProds {
    _$quantProdsAtom.reportRead();
    return super.quantProds;
  }

  @override
  set quantProds(int value) {
    _$quantProdsAtom.reportWrite(value, super.quantProds, () {
      super.quantProds = value;
    });
  }

  final _$addCartItemAsyncAction = AsyncAction('_CarrinhoMobxBase.addCartItem');

  @override
  Future<Null> addCartItem(CartProduct cartProduct) {
    return _$addCartItemAsyncAction.run(() => super.addCartItem(cartProduct));
  }

  final _$removeCartItemAsyncAction =
      AsyncAction('_CarrinhoMobxBase.removeCartItem');

  @override
  Future<Null> removeCartItem(CartProduct cartProduct) {
    return _$removeCartItemAsyncAction
        .run(() => super.removeCartItem(cartProduct));
  }

  final _$loadCurrentCartAsyncAction =
      AsyncAction('_CarrinhoMobxBase.loadCurrentCart');

  @override
  Future<Null> loadCurrentCart(UserMobx user) {
    return _$loadCurrentCartAsyncAction.run(() => super.loadCurrentCart(user));
  }

  final _$aumentaQuantidadeAsyncAction =
      AsyncAction('_CarrinhoMobxBase.aumentaQuantidade');

  @override
  Future<Null> aumentaQuantidade(CartProduct cartProduct) {
    return _$aumentaQuantidadeAsyncAction
        .run(() => super.aumentaQuantidade(cartProduct));
  }

  final _$diminuiQuantidadeAsyncAction =
      AsyncAction('_CarrinhoMobxBase.diminuiQuantidade');

  @override
  Future<Null> diminuiQuantidade(CartProduct cartProduct) {
    return _$diminuiQuantidadeAsyncAction
        .run(() => super.diminuiQuantidade(cartProduct));
  }

  final _$finishOrderAsyncAction = AsyncAction('_CarrinhoMobxBase.finishOrder');

  @override
  Future<String> finishOrder() {
    return _$finishOrderAsyncAction.run(() => super.finishOrder());
  }

  final _$_CarrinhoMobxBaseActionController =
      ActionController(name: '_CarrinhoMobxBase');

  @override
  void somatorios() {
    final _$actionInfo = _$_CarrinhoMobxBaseActionController.startAction(
        name: '_CarrinhoMobxBase.somatorios');
    try {
      return super.somatorios();
    } finally {
      _$_CarrinhoMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limpar() {
    final _$actionInfo = _$_CarrinhoMobxBaseActionController.startAction(
        name: '_CarrinhoMobxBase.limpar');
    try {
      return super.limpar();
    } finally {
      _$_CarrinhoMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atribuirDesconto(int descPerc, String? cupom) {
    final _$actionInfo = _$_CarrinhoMobxBaseActionController.startAction(
        name: '_CarrinhoMobxBase.atribuirDesconto');
    try {
      return super.atribuirDesconto(descPerc, cupom);
    } finally {
      _$_CarrinhoMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
frete: ${frete},
descontoPerc: ${descontoPerc},
products: ${products},
isLoading: ${isLoading},
totalProds: ${totalProds},
quantProds: ${quantProds},
quantItens: ${quantItens},
valorFrete: ${valorFrete},
valorDesc: ${valorDesc},
valorFinal: ${valorFinal}
    ''';
  }
}
