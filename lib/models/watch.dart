class Watch {
  final int id;
  final String brand;
  final String model;
  final double price;
  final String imageUrl;

  Watch({
    required this.id,
    required this.brand,
    required this.model,
    required this.price,
    required this.imageUrl,
  });

  factory Watch.createNewWatch(Map<String, dynamic> myMap) => Watch(
    id: myMap['id'],
    brand: myMap['brand'],
    model: myMap['model'],
    price: double.parse(myMap['price'].toString()),
    imageUrl: myMap['image_url'],
  );
}
