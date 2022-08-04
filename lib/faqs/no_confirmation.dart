import 'package:flutter/material.dart';

class NoConfirmation extends StatelessWidget {
  const NoConfirmation({Key? key}) : super(key: key);

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
              "Load May Have Been Processed Without Confirmation",
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
              "1. Check your balance by dialing *123# for Smart, TNT and Sun or *143# for Globe",
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
              "2. Send BAL to Gateway to check Load Wallet Balance ",
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
