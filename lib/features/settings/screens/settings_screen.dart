import 'package:amazon_clone/common/widgets/search_nav_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/services/acount_services.dart';
import 'package:amazon_clone/features/order/screens/your_orders_screen.dart';
import 'package:amazon_clone/features/webview/screen/web_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = '/setting-screen';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchNavBar(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
        child: Column(
          children: [
            const SettingTopView(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ExpansionPanelList(
                animationDuration: const Duration(
                  milliseconds: 1000,
                ),
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return const ListTile(
                        title: Text('Settings'),
                      );
                    },
                    body: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 100,
                        maxHeight: 280,
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        primary: true,
                        children: [
                          ListTile(
                            onTap: () {},
                            title: const Text('Country & Language'),
                          ),
                          ListTile(
                            onTap: () {},
                            title: const Text('Notifications'),
                          ),
                          ListTile(
                            onTap: () {},
                            title: const Text('Alexa'),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {},
                            title: const Text('Permissions'),
                          ),
                          ListTile(
                            onTap: () {},
                            title: const Text('Default Purchase Settings'),
                          ),
                          ListTile(
                            onTap: () {},
                            title: const Text('Legal & About'),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {},
                            title: const Text('Switch Accounts'),
                          ),
                          ListTile(
                            onTap: () => AccountServices().logOut(context),
                            title: const Text('Sign Out'),
                          ),
                        ],
                      ),
                    ),
                    isExpanded: _expanded,
                    canTapOnHeader: true,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {});
                },
              ),
            ),
            const Expanded(
              child: Text(''),
            ),
            const SettingBottomView(),
          ],
        ),
      ),
    );
  }
}

class SettingTopView extends StatelessWidget {
  const SettingTopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 140,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: 'https://pay.amazon.com/');
                  },
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/a_pay.jpeg',
                          height: 100,
                        ),
                      ),
                      const Text(
                        'Pay',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: 'https://www.amazon.in/minitv');
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          elevation: 2,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/minitv.jpeg',
                            height: 100,
                          ),
                        ),
                      ),
                      const Text(
                        'miniTv',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: 'https://www.amazongames.com/en-us');
                  },
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/funzone.jpeg',
                          height: 100,
                        ),
                      ),
                      const Text(
                        'Games',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingBottomView extends StatelessWidget {
  const SettingBottomView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, YourOrderScreen.routName),
                  },
                  child: const Text(
                    'Orders',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Buy Again',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () => {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(),
                    ),
                  },
                  child: const Text(
                    'Account',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Lists',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
