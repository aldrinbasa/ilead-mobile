import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';

import '../loading/loading.dart';
import '../wallet/wallet.dart';
import '../others/others.dart';

Route _routeToLoading() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoadingPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _routeToWallet() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const WalletPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _routeToOthers() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const OthersPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget> [
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
          onTap: () {Navigator.of(context).push(_routeToLoading());},
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
          onTap: () {Navigator.of(context).push(_routeToWallet());},
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
          onTap: () {Navigator.of(context).push(_routeToOthers());},
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
          onTap: () => print("Dealer was tapped"),
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
          onTap: () => print("Bills was tapped"),
          child: ListTile(
            leading: InvertColors(
              child: Image.asset(
                "assets/images/bills.png",
                width: 25,
                height: 25,
              ),
            ),
            title: const Text('Bills and Payment'),
          ),
        ),
        InkWell(
          onTap: () => print("Remittance was tapped"),
          child: ListTile(
            leading: InvertColors(
              child: Image.asset(
                "assets/images/remittance.png",
                width: 25,
                height: 25,
              ),
            ),
            title: const Text('Remittance'),
          ),
        ),
        InkWell(
          onTap: () => print("Organization was tapped"),
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
        InkWell(
          onTap: () => print("Richway Mall was tapped"),
          child: ListTile(
            leading: InvertColors(
              child: Image.asset(
                "assets/images/market.png",
                width: 25,
                height: 25,
              ),
            ),
            title: const Text('Richway Mall'),
          ),
        ),
        InkWell(
          onTap: () => print("Richway Wallet was tapped"),
          child: ListTile(
            leading: InvertColors(
              child: Image.asset(
                "assets/images/peso.png",
                width: 25,
                height: 25,
              ),
            ),
            title: const Text('Richway Wallet'),
          ),
        ),
      ],
    );
  }
}