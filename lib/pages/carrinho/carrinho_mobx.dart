import 'package:cursolojavirtual/pages/produtos/modeldata/product_data.dart';
import 'package:cursolojavirtual/pages/userlog/userlog_mobx.dart';
import 'package:mobx/mobx.dart';

import 'carrrinho_repository.dart';
import 'cart_product.dart';

part 'carrinho_mobx.g.dart';

class CarrinhoMobx = _CarrinhoMobxBase with _$CarrinhoMobx;

abstract class _CarrinhoMobxBase with Store {
  final UserMobx user;

  final CarrinhoRepository repository;

  _CarrinhoMobxBase(this.user) : repository = CarrinhoRepository(user) {
    somatorios();
  } // << construtor

  @observable
  double frete = 0;

  @observable
  int descontoPerc = 0;

  String cupomDesconto = '';

  @observable
  ObservableList<CartProduct> products = ObservableList.of([]);

  @observable
  bool isLoading = false;

  @computed
  int get quantItens => products.length;

  @computed
  double get valorFrete => 9.99;

  @computed
  double get valorDesc => totalProds * descontoPerc / 100;

  @observable
  double totalProds = 0.00;

  @observable
  int quantProds = 0;

  @computed
  double get valorFinal => totalProds + valorFrete - valorDesc;

  // @computed
  // int get quantProds {
  //   int soma = 0;
  //   products.forEach((p) => soma = soma + p.quantity);
  //   return soma;
  // }

  @action
  void somatorios() {
    totalProds = 0;
    quantProds = 0;
    products.forEach((p) {
      // if (p.productData != null)
      totalProds = totalProds + (p.quantity * p.productData.price);

      quantProds = quantProds + p.quantity;
    });
    print(
        ' >>>>> RODOU SOMATORIOS :: totalProds = $totalProds  /  quantPros = $quantProds ');
  }

  @action
  Future<Null> addCartItem(CartProduct cartProduct) async {
    isLoading = true;

    products.add(cartProduct);

    cartProduct.cid = await repository.addCartItem(cartProduct.toMap());

    somatorios();
    isLoading = false;
  }

  @action
  void limpar() {
    products.clear();
    frete = 0.0;
    descontoPerc = 0;
    totalProds = 0.00;
    quantProds = 0;
    cupomDesconto = '';
  }

  @action
  void atribuirDesconto(int descPerc, String? cupom) {
    cupomDesconto = cupom ?? '';
    descontoPerc = descPerc;
  }

  @action
  Future<Null> removeCartItem(CartProduct cartProduct) async {
    isLoading = true;

    //
    repository.deleteCartItem(cartProduct.cid);

    products.remove(cartProduct);
    somatorios();
    isLoading = false;
  }

  @action
  Future<Null> loadCurrentCart(UserMobx user) async {
    isLoading = true;

    print('entrou na funcao load carrinho');

    var qdocs = await repository.getCarrinho();

    print(qdocs.docs.toString());

    for (var doc in qdocs.docs) {
      CartProduct cc = CartProduct.fromDocument(doc);

      var prod = await repository.getProductDados(cc.category, cc.pid);
      cc.productData = ProductData.fromMap(prod);
      print('entrou no products.add');
      print('cc = ' + cc.toString());
      products.add(cc);
    }

    print('chamou somatorios do LoadCurrent Carrinho');
    somatorios();

    isLoading = false;
  }

  @action
  Future<Null> aumentaQuantidade(CartProduct cartProduct) async {
    isLoading = true;

    cartProduct.quantity = cartProduct.quantity + 1;

    int idx = products.indexWhere((prod) => (prod.cid == cartProduct.cid));
    products.removeAt(idx);
    products.insert(idx, cartProduct);

    await repository
        .updateCartItem(cartProduct.cid, {"quantity": cartProduct.quantity});

    somatorios();
    isLoading = false;
  }

  @action
  Future<Null> diminuiQuantidade(CartProduct cartProduct) async {
    isLoading = true;

    cartProduct.quantity = cartProduct.quantity - 1;
    int idx = products.indexWhere((prod) => (prod.cid == cartProduct.cid));
    products.removeAt(idx);
    products.insert(idx, cartProduct);

    await repository
        .updateCartItem(cartProduct.cid, {"quantity": cartProduct.quantity});
    // await firestoreInstance
    //     .collection("users")
    //     .document(user.firebaseUser.uid)
    //     .collection("cart")
    //     .document(cartProduct.cid)
    //     .update(data: {"quantity": cartProduct.quantity});

    somatorios();
    isLoading = false;
  }

  @action
  Future<String> finishOrder() async {
    if (products.length == 0) return '';
    isLoading = true;

    String idPedido = await repository.finalizarPedido(
        listProdutos:
            products.map((cartProduct) => cartProduct.toMap()).toList(),
        frete: frete,
        totalProds: totalProds,
        descontoPerc: descontoPerc,
        valorFinal: valorFinal);

    limpar();

    isLoading = false;

    return idPedido; //refOrder.id;
  }

  Future<Map<String, dynamic>> getCupom(String cupom) async =>
      await repository.getCupom(cupom);

  // @action
  // Future<Null> atribuiProductData(CartProduct cartProduct, ProductData prodData) async {
  //   isLoading = true;

  //   cartProduct.productData = prodData;
  //   somatorios();

  //   isLoading = false;
  // }
}
