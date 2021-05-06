import 'package:flutter/material.dart';

class TituloLojaVirtual extends StatelessWidget {
  const TituloLojaVirtual({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Loja Virtual\nem Flutter",
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
    );
  }
}
