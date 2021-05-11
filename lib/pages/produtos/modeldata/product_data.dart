class ProductData {
  late String category;

  String id;
  String title;
  String description;

  double price;

  List images;
  List sizes;

  ProductData.fromMap(Map<String, dynamic> prod)
      : this.id = prod['id'] ?? "",
        this.title = prod['title'] ?? '',
        this.description = prod['description'] ?? '',
        this.price = prod['price'] ?? 0.0 + 0.0,
        this.images = prod['images'] ?? List.empty(),
        this.sizes = prod['sizes'] ?? '',
        this.category = prod['category'] ?? '';

  Map<String, dynamic> toResumedMap() {
    return {"title": title, "description": description, "price": price};
  }
}
