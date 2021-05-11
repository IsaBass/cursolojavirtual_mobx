import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {
  final Map<String, dynamic> place;

  const PlaceTile({Key? key, required this.place}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100,
            child: Image.network(place['image'], fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(place['address']),
                Text(
                  place['phone'],
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Ver no Mapa'),
                onPressed: () {
                  launch(
                      "https://www.google.com/maps/search/?api=1&query=${place['lat']},${place['long']}");
                },
              ),
              TextButton(
                child: Text('Ligar'),
                onPressed: () {
                  launch("tel:${place['phone']}");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
