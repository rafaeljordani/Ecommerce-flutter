class Product {
  final String id;
  final String name;
  final String imageUrl;
  final String brand;
  final double price;
  final String category;
  final String categoryId;
  final String description;

  Product({
    required this.name,
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.category,
    required this.id,
    required this.categoryId,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      brand: json['brand'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      categoryId: json['categoryId'],
      description: json['description'],
    );
  }
}
