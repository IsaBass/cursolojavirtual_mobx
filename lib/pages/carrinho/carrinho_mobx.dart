import 'package:cloud_firestore_all/cloud_firestore_all.dart';
import 'package:cursolojavirtual/pages/carrinho/carrrinho_repository.dart';
import 'package:cursolojavirtual/pages/produtos/product_data.dart';
import 'package:cursolojavirtual/pages/userlog/userlog_mobx.dart';

import 'package:mobx/mobx.dart';

import 'cart_product.dart';

part 'carrinho_mobx.g.dart';

class CarrinhoMobx = _CarrinhoMobxBase with _$CarrinhoMobx;

abstract class _CarrinhoMobxBase with Store {
  UserMobx user;

  CarrinhoRepository repository;

  _CarrinhoMobxBase(this.user) {
    repository = CarrinhoRepository(user);
    somatorios();
  } // << construtor

  @observable
  double frete = 0;

  @observable
  int descontoPerc = 0;

  String cupomDesconto;

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
  double totalProds;

  @observable
  int quantProds;

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
      if (p.productData != null)
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

    // await firestoreInstance
    //     .collection("users")
    //     .document(user.firebaseUser.uid)
    //     .collection("cart")
    //     .add(cartProduct.toMap())
    //     .then((doc) {
    //   cartProduct.cid = doc.id;
    // });

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
    cupomDesconto = null;
  }

  @action
  void atribuirDesconto(int descPerc, String cupom) {
    cupomDesconto = cupom;
    descontoPerc = descPerc;
  }

  @action
  Future<Null> removeCartItem(CartProduct cartProduct) async {
    isLoading = true;

    repository.deleteCartItem(cartProduct.cid);
    // await firestoreInstance
    //     .collection("users")
    //     .document(user.firebaseUser.uid)
    //     .collection("cart")
    //     .document(cartProduct.cid)
    //     .delete();

    products.remove(cartProduct);
    somatorios();
    isLoading = false;
  }

  @action
  Future<Null> loadCurrentCart(UserMobx user) async {
    isLoading = true;
    if (user != null) {
      print('entrou na funcao load carrinho');

      // CollectionReference ref1 = firestoreInstance
      //     .collection("users")
      //     .document(user.firebaseUser.uid)
      //     .collection("cart");

      // CollectionReference ref2 = firestoreInstance.collection('products');

      // await ref1.getDocuments().then((qdocs) {
      //   products.addAll(qdocs.docs.map((doc) => CartProduct.fromDocument(doc)));

      //   products.forEach((p) async {
      //     await ref2
      //         .document(p.category)
      //         .collection('items')
      //         .document(p.pid)
      //         .get()
      //         .then((s) {
      //       p.productData = ProductData.fromDocument(s);
      //       print('chamou somatorios do LoadCurrent Carrinho');
      //       somatorios();
      //     });
      //   });
      // });

      QuerySnapshot qdocs = await repository.getCarrinho();

      print(qdocs.docs.toString());

      for (DocumentSnapshot doc in qdocs.docs) {
        CartProduct cc = CartProduct.fromDocument(doc);

        await repository.getProductDados(cc.category, cc.pid).then((prod) {
          cc.productData = ProductData.fromDocument(prod);
          print('entrou no products.add');
          print('cc = ' + cc.toString());
          products.add(cc);
        });
      }
    }
    ;

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
    if (products.length == 0) return null;
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

  // @action
  // Future<Null> atribuiProductData(CartProduct cartProduct, ProductData prodData) async {
  //   isLoading = true;

  //   cartProduct.productData = prodData;
  //   somatorios();

  //   isLoading = false;
  // }
}
