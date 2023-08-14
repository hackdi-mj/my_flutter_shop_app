class ProductCart {
  final String id;
  final String name;
  final String picture;
  final String size;
  final double price;
  int quantity;

  ProductCart({
    required this.id,
    required this.name,
    required this.picture,
    required this.size,
    required this.price,
    required this.quantity,
  });
}
