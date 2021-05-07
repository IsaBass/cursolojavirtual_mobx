import 'package:cursolojavirtual/pages/orders/orders_controller.dart';
import 'package:cursolojavirtual/pages/orders/widgets/ordertile.dart';
import 'package:cursolojavirtual/pages/userlog/userlog_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class OrdersTab extends StatelessWidget {
  final _controller = OrdersController();

  @override
  Widget build(BuildContext context) {
    return (GetIt.I<UserMobx>().estaLogado == false)
        ? Container(alignment: Alignment.center, child: Text('Não Logado'))
        : Container(
            child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _controller.getOrders(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return ListView(
                    children: snapshot.data!
                        .map((ped) => OrderTile(ped: ped))
                        .toList(),
                  );
                }),
          );
  }
}
