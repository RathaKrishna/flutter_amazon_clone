// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/features/products/services/product_services.dart';
import 'package:amazon_clone/models/products.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final ProductServices productServices = ProductServices();

  void increaseQuantity(Product product) {
    productServices.addToCart(
      context: context,
      product: product,
    );
  }

  void decreaseQuantity(Product product) {
    productServices.removeFromCart(context: context, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.images[0],
            fit: BoxFit.fitWidth,
            height: 135,
            width: 135,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '₹ ${product.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text(
                  'Eligible for FREE Shipping',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const Text(
                  'In Stock',
                  style: TextStyle(color: Colors.teal),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black12,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => decreaseQuantity(product),
                              child: Container(
                                width: 35,
                                height: 32,
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 1.5,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Container(
                                width: 35,
                                height: 32,
                                alignment: Alignment.center,
                                child: Text(quantity.toString()),
                              ),
                            ),
                            InkWell(
                              onTap: () => increaseQuantity(product),
                              child: Container(
                                width: 35,
                                height: 32,
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
