import 'package:flutter/material.dart';

class InvalidCommand extends StatelessWidget {
  const InvalidCommand({Key? key}) : super(key: key);

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
              "Invalid Command",
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
              "1. Make sure no double spacing.",
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
              "2. Make sure you type the correct product code in the list.",
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
              "3. “REP” must be in CAPITAL LETTERS",
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
              "4. Reset Your phone settings.",
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
              "5. Command copied from messenger usually is invalid. Retype the whole command or spacing.",
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
