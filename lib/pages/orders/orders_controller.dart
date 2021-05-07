import 'package:cursolojavirtual/pages/orders/orders_repository.dart';
import 'package:cursolojavirtual/pages/userlog/userlog_mobx.dart';
import 'package:get_it/get_it.dart';

class OrdersController {
  final _repository = OrdersRepository();

  final UserMobx user = GetIt.I<UserMobx>();

  Future<List<Map<String, dynamic>>> getOrders() async {
    return await _repository.getOrders(user.firebaseUser!.uid);
  }
}
