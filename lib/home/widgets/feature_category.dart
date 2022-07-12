import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FeaturedCategories extends StatelessWidget {
  const FeaturedCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: const Text(
                  'Featured Categories',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Image.network(
                        'https://m.media-amazon.com/images/I/41oLL0iztcL._SX294_.jpg',
                        height: 280,
                        fit: BoxFit.fitHeight,
                        width: MediaQuery.of(context).size.width / 3.2,
                      ),
                      const Text(
                        'Mobiles & \nElectorincs',
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://m.media-amazon.com/images/I/51hkCdrbYGL._SX294_.jpg',
                        height: 280,
                        width: MediaQuery.of(context).size.width / 3.2,
                        fit: BoxFit.fitHeight,
                      ),
                      const Text(
                        'Amazon \nFashion',
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://m.media-amazon.com/images/I/41G1ET7T5DL._SX294_.jpg',
                        width: MediaQuery.of(context).size.width / 3.3,
                        height: 280,
                        fit: BoxFit.fitHeight,
                      ),
                      const Text(
                        'Home & \nKitchen',
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'See All Categories',
                  style: TextStyle(color: Colors.cyan[800]),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 20,
          thickness: 5,
          color: Color.fromARGB(255, 214, 219, 220),
        ),
      ],
    );
  }
}
