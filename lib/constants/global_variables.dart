import 'package:flutter/material.dart';

String uri =
    'http://*.*.*.*:3000'; // Please enter your local Ip  or //'https://arpa-amazon-clone.herokuapp.com'; //

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const appColor = Color.fromARGB(255, 29, 201, 192);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpg',
    },
    {
      'title': 'Electronics',
      'image': 'assets/images/electronics.jpg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpg',
    },
    {
      'title': 'Books, Toys',
      'image': 'assets/images/books.jpg',
    },
    {
      'title': 'Home',
      'image': 'assets/images/home.jpeg',
    },
    {
      'title': 'miniTV',
      'image': 'assets/images/minitv.jpg',
    },
    {
      'title': 'Fresh',
      'image': 'assets/images/fresh.jpg',
    },
  ];

  static const List<Map<String, String>> pfsImages = [
    {
      'title': 'Top picks under ₹199',
      'image':
          'https://m.media-amazon.com/images/I/31t0jAW8FoL._SR420,420_.jpg',
    },
    {
      'title': 'Top picks under ₹299',
      'image':
          'https://m.media-amazon.com/images/I/31E71zRxUCL._SR420,420_.jpg',
    },
    {
      'title': 'Top picks under ₹399',
      'image':
          'https://m.media-amazon.com/images/I/31BZoGXNQlL._SR420,420_.jpg',
    },
    {
      'title': 'Top picks under ₹499',
      'image':
          'https://m.media-amazon.com/images/I/31utcnt9VkL._SR420,420_.jpg',
    },
  ];
}
