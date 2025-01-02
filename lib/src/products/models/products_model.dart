import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  final int id;
  final String title;
  final double price;
  final String description;
  final bool isFeatured;
  final String productType;
  final double rating;
  final List<String> imageUrls;
  final DateTime createdAt;
  final int category;
  final int brand;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.isFeatured,
    required this.productType,
    required this.rating,
    required this.imageUrls,
    required this.createdAt,
    required this.category,
    required this.brand,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        isFeatured: json["is_featured"],
        productType: json["productType"],
        rating: json["rating"]?.toDouble(),
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        category: json["category"],
        brand: json["brand"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "is_featured": isFeatured,
        "productType": productType,
        "rating": rating,
        "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "category": category,
        "brand": brand,
      };
}
