import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class OrderTopView extends StatefulWidget {
  const OrderTopView({Key? key}) : super(key: key);

  @override
  State<OrderTopView> createState() => _OrderTopViewState();
}

class _OrderTopViewState extends State<OrderTopView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: GlobalVariables.selectedNavBarColor,
                        width: 3,
                      ),
                    ),
                  ),
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Your Orders',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () {},
                child: const Text(
                  'Buy Again',
                  style: TextStyle(fontSize: 16),
                )),
          ],
        ),
        const Divider(
          color: Colors.blueGrey,
          height: 1,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 44,
          child: Row(
            children: const [
              Icon(
                Icons.search,
                color: Colors.teal,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  'Search all orders',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              VerticalDivider(
                color: Colors.blueGrey,
              ),
              Text('Filter'),
              Icon(
                Icons.arrow_right,
                size: 20,
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.blueGrey,
          height: 1,
        ),
        Container(
          color: const Color.fromARGB(255, 246, 246, 247),
          height: 44,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: const Text(
            '   Last 6 months',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
