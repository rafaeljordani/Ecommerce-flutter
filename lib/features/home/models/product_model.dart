class Product {
  final String name;
  final String imageUrl;
  final String brand;
  final double price;
  final String category;

  Product({
    required this.name,
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brand: json['brand'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      category: json['category'],
    );
  }
}
