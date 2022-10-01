// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Buyer {
  final int id;
  final String name;
  final String phoneNo;
  final String pincode;
  Buyer({
    required this.id,
    required this.name,
    required this.phoneNo,
    required this.pincode,
  });

  Buyer copyWith({
    int? id,
    String? name,
    String? phoneNo,
    String? pincode,
  }) {
    return Buyer(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNo: phoneNo ?? this.phoneNo,
      pincode: pincode ?? this.pincode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNo': phoneNo,
      'pincode': pincode,
    };
  }

  factory Buyer.fromMap(Map<String, dynamic> map) {
    return Buyer(
      id: map['id'] as int,
      name: map['name'] as String,
      phoneNo: map['phoneNo'] as String,
      pincode: map['pincode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Buyer.fromJson(String source) =>
      Buyer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Buyer(id: $id, name: $name, phoneNo: $phoneNo, pincode: $pincode)';
  }

  @override
  bool operator ==(covariant Buyer other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phoneNo == phoneNo &&
        other.pincode == pincode;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ phoneNo.hashCode ^ pincode.hashCode;
  }
}
