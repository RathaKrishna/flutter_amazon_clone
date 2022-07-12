import 'package:amazon_clone/home/widgets/address_bar.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddressBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Row(
            children: [
              Image.asset(
                'assets/images/empty_cart.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Amazon Cart is empty',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: const Text(
                      'Pick up where you left off',
                      style: TextStyle(color: Colors.teal, fontSize: 15),
                    ),
                    onTap: () {
                      showBottomModel(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          color: const Color.fromRGBO(249, 221, 221, 1),
          child: Column(
            children: const [
              Text(
                'Get 10% cashback up to \$50',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'Pay withh Amazon Pay UPI. T&C apply.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<dynamic> showBottomModel(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 300,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Keep shopping for',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recently viewed categories and products appear hear to make it easy to pick up where you left off',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Continue shopping',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'View your browsing history',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
