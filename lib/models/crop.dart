// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CropCatalog {
  static List<Crop> crops = [
    Crop(id: 1, name: "Wheat", price: "3000", stock: "41234")
  ];
}

class Crop {
  final int id;
  final String name;
  final String price;
  final String stock;
  Crop({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  Crop copyWith({
    int? id,
    String? name,
    String? price,
    String? stock,
  }) {
    return Crop(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
    };
  }

  factory Crop.fromMap(Map<String, dynamic> map) {
    return Crop(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as String,
      stock: map['stock'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Crop.fromJson(String source) =>
      Crop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Crop(id: $id, name: $name, price: $price, stock: $stock)';
  }

  @override
  bool operator ==(covariant Crop other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.stock == stock;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ price.hashCode ^ stock.hashCode;
  }
}
