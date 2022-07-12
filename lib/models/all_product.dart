// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amazon_clone/models/products.dart';

class AllProduct {
  final Product product;

  AllProduct({
    required this.product,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
    };
  }

  factory AllProduct.fromMap(Map<String, dynamic> map) {
    return AllProduct(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllProduct.fromJson(String source) =>
      AllProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}
