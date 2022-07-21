import 'package:flutter/material.dart';

import './what_is_tlc.dart';
import './potential_income.dart';
import './tlc_limit.dart';

Route _routeToWTLC() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const WhatIsTLC(),
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

Route _routeToPotentialIncome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const PotentialIncome(),
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

Route _routeToTLCLimit() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const TLCLimit(),
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
          child: ListView(padding: const EdgeInsets.all(25), children: [
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
                  onTap: () {Navigator.of(context).push(_routeToWTLC());},
                  child: const ListTile(
                    leading: Icon(Icons.question_mark_sharp, color: Colors.blueAccent,),
                    title: Text(
                      "What is TLC?",
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
                  onTap: () {Navigator.of(context).push(_routeToPotentialIncome());},
                  child: const ListTile(
                    leading: Icon(Icons.question_mark_sharp, color: Colors.blueAccent,),
                    title: Text(
                      "TLC Potential Income?",
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
                  onTap: (){Navigator.of(context).push(_routeToTLCLimit());},
                  child: const ListTile(
                    leading: Icon(Icons.question_mark_sharp, color: Colors.blueAccent,),
                    title: Text(
                      "TLC Limit?",
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