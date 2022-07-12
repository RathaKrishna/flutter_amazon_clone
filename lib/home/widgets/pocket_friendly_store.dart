import 'dart:math';

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PocketFriendlyStore extends StatelessWidget {
  const PocketFriendlyStore({Key? key}) : super(key: key);

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
                  'Pocket friendly stores',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: GlobalVariables.pfsImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network(
                        GlobalVariables.pfsImages[index]['image']!,
                        width: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.fitWidth,
                        height: 150,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(GlobalVariables.pfsImages[index]['title']!)
                    ],
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'See more',
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
