import 'dart:ffi';

class Watch {
  final int id;
  final String brand;
  final String model;
  final Int price;
  final String imageUrl;
  final String origin;
  final String localization;

  Watch({
    required this.id,
    required this.brand,
    required this.model,
    required this.price,
    required this.imageUrl,
    required this.origin,
    required this.localization
  });


    factory Watch.createNewWatch(Map<String, dynamic> myMap) => Watch(
      id: myMap['id'],
      brand: myMap['brand'],
      model: myMap['model'],
      price: myMap['price'],
      imageUrl: myMap['image'],
      origin: myMap['origin']['brand'],
      localization: myMap['location']['brand'],
    );
}
