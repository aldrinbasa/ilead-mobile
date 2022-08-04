import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../loading/loading.dart';
import '../wallet/wallet.dart';
import '../others/others.dart';
import '../dealer/dealer_menu.dart';
import '../settings/settings.dart';
import '../faqs/faq_menu.dart';

import '../services/route_service.dart';

RouteManager routeManager = RouteManager();

_launchUrl() async {
  final Uri _url = Uri.parse("http://dealer.rwayent.com/");

  if (await canLaunchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw "Could not launch $_url";
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 100,
          child: const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'ILead Loading',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(routeManager.routeTo(() => LoadingPage()));
          },
          child: ListTile(
            leading: InvertColors(
              child: Image.asset(
                "assets/images/load.png",
                width: 25,
                height: 25,
              ),
            ),
            title: const Text('Loading'),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(routeManager.routeTo(() => WalletPage()));
          },
          child: ListTile(
            leading: InvertColors(
              child: Image.asset(
                "assets/images/wallet.png",
                width: 25,
                height: 25,
              ),
            ),
            title: const Text('Wallet'),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(routeManager.routeTo(() => OthersPage()));
          },
          child: ListTile(
            leading: InvertColors(
              child: Image.asset(
                "assets/images/others.png",
                width: 25,
                height: 25,
              ),
            ),
            title: const Text('Others'),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(routeManager.routeTo(() => DealerPage()));
          },
          child: ListTile(
            leading: InvertColors(
              child: Image.asset(
                "assets/images/dealer.png",
                width: 25,
                height: 25,
              ),
            ),
            title: const Text('Dealer'),
          ),
        ),
        InkWell(
          onTap: () {
            _launchUrl();
          },
          child: ListTile(
            leading: InvertColors(
              child: Image.asset(
                "assets/images/organization.png",
                width: 25,
                height: 25,
              ),
            ),
            title: const Text('Organization'),
          ),
        ),
        Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey[400],
          height: 20,
        ),
        InkWell(
          onTap: () {
            print("go to tutorial");
          },
          child: const ListTile(
            leading: Icon(Icons.tungsten_rounded),
            title: Text('App Tutorial'),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(routeManager.routeTo(() => SettingsPage()));
          },
          child: const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(routeManager.routeTo(() => FAQPage()));
          },
          child: const ListTile(
            leading: Icon(Icons.question_mark),
            title: Text("F.A.Q.S."),
          ),
        ),
        InkWell(
          onTap: () {
            print("Go to terms and conditions");
          },
          child: const ListTile(
            leading: Icon(Icons.file_copy),
            title: Text('Terms and Conditions'),
          ),
        ),
        InkWell(
          onTap: () {
            print("Go to Privacy Policy");
          },
          child: const ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
          ),
        ),
        Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey[400],
          height: 20,
        ),
        InkWell(
          onTap: () {
            print('all rights reserved');
          },
          child: const ListTile(
            title: Text('\u00a92022 RWay All Rights Reserved'),
          ),
        ),
      ],
    );
  }
}
