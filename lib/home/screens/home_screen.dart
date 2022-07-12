import 'package:amazon_clone/common/widgets/search_nav_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/home/widgets/address_bar.dart';
import 'package:amazon_clone/home/widgets/carousel_image.dart';
import 'package:amazon_clone/home/widgets/deal_of_day.dart';
import 'package:amazon_clone/home/widgets/feature_category.dart';
import 'package:amazon_clone/home/widgets/pocket_friendly_store.dart';
import 'package:amazon_clone/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchNavBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddressBar(),
            const SizedBox(
              height: 10,
            ),
            const TopCategories(),
            const SizedBox(
              height: 10,
            ),
            const CarouselImage(),
            const DealOfDay(),
            const Divider(
              height: 20,
              thickness: 5,
              color: Color.fromARGB(255, 214, 219, 220),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 10,
              ),
              child: Text(
                'Watch the Patolas | only on miniTv',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                'https://m.media-amazon.com/images/I/71DIdPcx3ML._SR1050,1050_.jpg',
                width: double.maxFinite,
                fit: BoxFit.fill,
                height: 380,
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              color: Color.fromARGB(255, 214, 219, 220),
            ),
            const PocketFriendlyStore(),
            const FeaturedCategories(),
          ],
        ),
      ),
    );
  }
}
