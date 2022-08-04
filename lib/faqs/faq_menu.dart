import 'package:flutter/material.dart';

import './different_number.dart';
import '../services/route_service.dart';
import './no_response.dart';
import './invalid_command.dart';
import './no_confirmation.dart';
import './help.dart';

RouteManager routeManager = RouteManager();

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("ILead Wallet"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                const Text(
                  "F.A.Q.S",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Frequently Asked Questions",
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
                    Navigator.of(context)
                        .push(routeManager.routeTo(() => DifferentNumber()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.question_mark_sharp,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "WHEN LOADING USING DIFFERENT NUMBER",
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
                        .push(routeManager.routeTo(() => NoResponse()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.question_mark_sharp,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "IF NO RESPONSE",
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
                        .push(routeManager.routeTo(() => InvalidCommand()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.question_mark_sharp,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "INVALID COMMAND",
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
                        .push(routeManager.routeTo(() => NoConfirmation()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.question_mark_sharp,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "NO CONFIRMATION",
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
                        .push(routeManager.routeTo(() => Help()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.question_mark_sharp,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "HELP",
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
