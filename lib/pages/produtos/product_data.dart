import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  late String category;

  String id;
  String title;
  String description;

  double price;

  List images;
  List sizes;

  ProductData.fromDocument(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        title = snapshot.data()!['title'] ?? '',
        description = snapshot.data()!['description'] ?? '',
        price = snapshot.data()!['price'] ?? 0.0 + 0.0,
        images = snapshot.data()!['images'] ?? List.empty(),
        sizes = snapshot.data()!['sizes'] ?? '';

  Map<String, dynamic> toResumedMap() {
    return {"title": title, "description": description, "price": price};
  }
}
