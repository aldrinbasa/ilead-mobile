import 'package:flutter/material.dart';

class PotentialIncome extends StatelessWidget {
  const PotentialIncome({Key? key}) : super(key: key);

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
              "Potential Income",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}