class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? discountPrice;
  final String category;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final int stock;
  final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.discountPrice,
    required this.category,
    required this.imageUrl,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.stock = 0,
    this.images = const [],
  });

  double get finalPrice => discountPrice ?? price;

  int get discountPercentage {
    if (discountPrice == null) return 0;
    return (((price - discountPrice!) / price) * 100).round();
  }

  bool get hasDiscount => discountPrice != null && discountPrice! < price;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discountPrice': discountPrice,
      'category': category,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'stock': stock,
      'images': images,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPrice: json['discountPrice']?.toDouble(),
      category: json['category'],
      imageUrl: json['imageUrl'],
      rating: json['rating']?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
      stock: json['stock'] ?? 0,
      images: List<String>.from(json['images'] ?? []),
    );
  }
}
