import 'package:amazon_clone/features/account/services/acount_services.dart';
import 'package:amazon_clone/features/account/widgets/tags_button.dart';
import 'package:amazon_clone/features/order/screens/your_orders_screen.dart';
import 'package:amazon_clone/features/settings/screens/your_account.dart';
import 'package:flutter/material.dart';

class TopTags extends StatelessWidget {
  const TopTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TagsButton(
              text: 'Your Orders',
              onTap: () {
                Navigator.pushNamed(context, YourOrderScreen.routName);
              },
            ),
            TagsButton(
              text: 'Your Account',
              onTap: () {
                Navigator.pushNamed(context, YourAccountScreen.routeName);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TagsButton(
              text: 'Log Out',
              onTap: () => AccountServices().logOut(context),
            ),
            TagsButton(
              text: 'Your Wish List',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
