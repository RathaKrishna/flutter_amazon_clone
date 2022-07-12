import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/search_nav_bar.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/cart/widgets/cart_product.dart';
import 'package:amazon_clone/features/cart/widgets/cart_sub_total.dart';
import 'package:amazon_clone/features/cart/widgets/empty_cart.dart';
import 'package:amazon_clone/home/widgets/address_bar.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToAddress(int sum) {
    Navigator.pushNamed(context, AddressScreen.routeName,
        arguments: sum.toString());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map(((e) => sum += e['quantity'] * e['product']['price'] as int))
        .toList();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchNavBar(),
      ),
      body: user.cart.isEmpty
          ? const EmptyCart()
          : Column(
              children: [
                const AddressBar(),
                const CartSubtotal(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: 'Proceed to Buy (${user.cart.length} items)',
                    onTap: () => navigateToAddress(sum),
                    color: Colors.yellow[600],
                    textColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: user.cart.length,
                    itemBuilder: (context, index) {
                      return CartProduct(
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
