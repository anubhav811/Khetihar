// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'crop.dart';

class Farmer {
  final int id;
  final String name;
  final String accNo;
  final String pincode;
  final String phoneNo;
  List<Crop> crops;
  Farmer({
    required this.id,
    required this.name,
    required this.accNo,
    required this.pincode,
    required this.phoneNo,
    required this.crops,
  });

  Farmer copyWith({
    int? id,
    String? name,
    String? accNo,
    String? pincode,
    String? phoneNo,
    List<Crop>? crops,
  }) {
    return Farmer(
      id: id ?? this.id,
      name: name ?? this.name,
      accNo: accNo ?? this.accNo,
      pincode: pincode ?? this.pincode,
      phoneNo: phoneNo ?? this.phoneNo,
      crops: crops ?? this.crops,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'accNo': accNo,
      'pincode': pincode,
      'phoneNo': phoneNo,
      'crops': crops.map((x) => x.toMap()).toList(),
    };
  }

  factory Farmer.fromMap(Map<String, dynamic> map) {
    return Farmer(
      id: map['id'] as int,
      name: map['name'] as String,
      accNo: map['accNo'] as String,
      pincode: map['pincode'] as String,
      phoneNo: map['phoneNo'] as String,
      crops: List<Crop>.from(
        (map['crops'] as List<int>).map<Crop>(
          (x) => Crop.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Farmer.fromJson(String source) =>
      Farmer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Farmer(id: $id, name: $name, accNo: $accNo, pincode: $pincode, phoneNo: $phoneNo, crops: $crops)';
  }

  @override
  bool operator ==(covariant Farmer other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.accNo == accNo &&
        other.pincode == pincode &&
        other.phoneNo == phoneNo &&
        listEquals(other.crops, crops);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        accNo.hashCode ^
        pincode.hashCode ^
        phoneNo.hashCode ^
        crops.hashCode;
  }
}
