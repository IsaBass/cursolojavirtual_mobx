import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cursolojavirtual/pages/places/place_tile.dart';
import 'package:flutter/material.dart';

class PlacesTab extends StatelessWidget {
  const PlacesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance.collection('places').get(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.none:
              return Center(
                child: Text('Sem lojas cadastradas'),
              );

            default:
              return ListView(
                children: snapshot.data!.docs
                    .map((e) => PlaceTile(place: e.data()))
                    .toList(),
              );
          }
        },
      ),
    );
  }
}
