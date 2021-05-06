import 'package:cursolojavirtual/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final int page;

  DrawerTile(this.icon, this.text, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onTap2(context),
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: GetIt.I<HomeController>().pageControler.page?.round() ==
                        page
                    ? Colors.black
                    : Colors.grey[700],
              ),
              SizedBox(width: 32.0),
              Text(
                text,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onTap2(BuildContext context) {
    Navigator.of(context).pop();

    GetIt.I<HomeController>().pageControler.animateToPage(
          page,
          curve: Curves.easeInOut,
          duration: Duration(seconds: 1),
        );
  }
}
