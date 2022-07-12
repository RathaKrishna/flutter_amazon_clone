// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/models/all_product.dart';
import 'package:amazon_clone/models/products.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/models/order.dart';

class YourOrderCell extends StatelessWidget {
  final AllProduct product;
  const YourOrderCell({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network(
            product.product.images[0],
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text('Delivered at ${DateTime.now()}'),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 20,
          ),
        ],
      ),
    );
  }
}
