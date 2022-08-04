import 'package:flutter/material.dart';

class DifferentNumber extends StatelessWidget {
  const DifferentNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ's"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Icon(
              Icons.question_answer_rounded,
              color: Colors.blue,
              size: screenHeight * 0.1,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const Text(
              "When Loading Using Different Number",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Text(
              "1. The system will not respond for invalid command, invalid product code and invalid user name.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Text(
              "2. The system will lock the account on the 5th incorrect password.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Text(
              "3. ₱50 will be charged for Unlocking to be deducted to your LW.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
