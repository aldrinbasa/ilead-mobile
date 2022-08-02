import 'package:flutter/material.dart';

import 'package:invert_colors/invert_colors.dart';
import 'package:flutter_sms/flutter_sms.dart';

import './help.dart';
import './change_password.dart';
import './reload_solutions.dart';

import '../services/route_service.dart';
import '../configurations/settings.dart' as configurations;

List<String> gateWayNumber = [configurations.savedGateWay];

RouteManager routeManager = RouteManager();

Route _routeToChangePassword() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ChangePasswordPage(),
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

void sendBalanceRequest() async {
  String send_result = await sendSMS(message: "BAL", recipients: gateWayNumber)
      .catchError((err) {
    print(err);
  });
  print(send_result);
}

class OthersPage extends StatelessWidget {
  const OthersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Others"),
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
                    'assets/images/others.png',
                    width: screenWidth * 0.2,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                const Text(
                  "Other Services",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Balance, Help, and Other Services",
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
                    sendBalanceRequest();
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.wallet,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "WALLET BALANCE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.send),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(routeManager.routeTo(() => HelpPage()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.live_help,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "CUSTOMER SERVICE HELP",
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
                    Navigator.of(context)
                        .push(routeManager.routeTo(() => ChangePasswordPage()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.password_rounded,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "CHANGE PASSWORD",
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
                    Navigator.of(context).push(routeManager
                        .routeTo(() => const ReloadSolutionsPage()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.verified_user,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "RELOAD SOLUTIONS",
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
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(
                      Icons.checklist,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "RETAILER-RETAILER ACTIVATION",
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
