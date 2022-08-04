import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';

import './tlc.dart';
import './tu.dart';
import './faqs/menu.dart';

Route _routeToTLC() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const TLCPage(),
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

Route _routeToTU() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const TUPage(),
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

Route _routeToFAQS() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const FAQPage(),
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

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String command = "";
  bool repeatTransaction = false;

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();
  List<String> phoneNumber = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Wallet"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Column(
              children: [
                SizedBox(height: screenHeight * 0.01),
                InvertColors(
                  child: Image.asset(
                    'assets/images/wallet.png',
                    width: screenWidth * 0.2,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                const Text(
                  "Richway Wallet",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Wallet to Wallet Transfer",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent[400]),
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(_routeToTLC());
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.wallet,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "SEND WALLET FUNDS",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(_routeToTU());
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.token,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "FORWARD TU PINS",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(_routeToFAQS());
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.question_answer,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "FREQUENTLY ASKED QUESTIONS",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
