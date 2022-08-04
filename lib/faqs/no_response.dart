import 'package:flutter/material.dart';

class NoResponse extends StatelessWidget {
  const NoResponse({Key? key}) : super(key: key);

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
              "If No Response",
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
              "1. System may not have received your command. To check if it was successful send BAL to gateway.",
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
              "2. If you didn't receive the response of TLC as a receiver but the sender did receive the response. You can check by sending BAL to gateway.",
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
              "3. Never resend w/ REP if you didn't receive the response. There might be some delay on your txt receiving by the system or the system did not receive your SMS command. Just resend the command. You can resend it as many as you want w/o REP to avoid duplicate transactions.",
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
              "4. Restart your phone incase no confirmation receive.",
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
              "5. Send to another gateway.",
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
