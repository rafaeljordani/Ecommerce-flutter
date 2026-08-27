class Product {
  final String name;
  final String imageUrl;
  final String brand;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.brand,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brand: json['brand'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
    );
  }
}
