import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Address {
  final String id;
  final String name;
  final String mobile;
  final String flatNo;
  final String area;
  final String pincode;
  final String city;
  final bool isDefault;
  Address({
    required this.id,
    required this.name,
    required this.mobile,
    required this.flatNo,
    required this.area,
    required this.pincode,
    required this.city,
    required this.isDefault,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'mobile': mobile,
      'flatNo': flatNo,
      'area': area,
      'pincode': pincode,
      'city': city,
      'isDefault': isDefault,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      mobile: map['mobile'] ?? '',
      flatNo: map['flat'] ?? '',
      area: map['area'] ?? '',
      pincode: map['pincode'] ?? '',
      city: map['city'] ?? '',
      isDefault: map['isDefault'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
