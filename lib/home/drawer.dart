import 'package:flutter/material.dart';
import 'package:ilead_mobile/dealer/dealer_menu.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../loading/loading.dart';
import '../wallet/wallet.dart';
import '../others/others.dart';
import '../dealer/dealer.dart';

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
        const DrawerHeader(
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
        // InkWell(
        //   onTap: () => print("Bills was tapped"),
        //   child: ListTile(
        //     leading: InvertColors(
        //       child: Image.asset(
        //         "assets/images/bills.png",
        //         width: 25,
        //         height: 25,
        //       ),
        //     ),
        //     title: const Text('Bills and Payment'),
        //   ),
        // ),
        // InkWell(
        //   onTap: () => print("Remittance was tapped"),
        //   child: ListTile(
        //     leading: InvertColors(
        //       child: Image.asset(
        //         "assets/images/remittance.png",
        //         width: 25,
        //         height: 25,
        //       ),
        //     ),
        //     title: const Text('Remittance'),
        //   ),
        // ),
        // InkWell(
        //   onTap: () => print("Richway Mall was tapped"),
        //   child: ListTile(
        //     leading: InvertColors(
        //       child: Image.asset(
        //         "assets/images/market.png",
        //         width: 25,
        //         height: 25,
        //       ),
        //     ),
        //     title: const Text('Richway Mall'),
        //   ),
        // ),
        // InkWell(
        //   onTap: () => print("Richway Wallet was tapped"),
        //   child: ListTile(
        //     leading: InvertColors(
        //       child: Image.asset(
        //         "assets/images/peso.png",
        //         width: 25,
        //         height: 25,
        //       ),
        //     ),
        //     title: const Text('Richway Wallet'),
        //   ),
        // ),
      ],
    );
  }
}
