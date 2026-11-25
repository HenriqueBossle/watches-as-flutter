import 'dart:ffi';

class Watch {
  final int id;
  final String brand;
  final String model;
  final Int price;
  final String imageUrl;

  Watch({
    required this.id,
    required this.brand,
    required this.model,
    required this.price,
    required this.imageUrl,
  });

  factory Watch.fromJson(Map<String, dynamic> json) => Watch(
        id: json['id'],
        brand: json['brand'],
        model: json['model'],
        price: json['price'],
        imageUrl: json['image'],
      );
}
