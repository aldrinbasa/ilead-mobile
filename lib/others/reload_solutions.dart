import 'package:flutter/material.dart';

Card SolutionsCard (double screenHeight, String title, String name, String number){
  return Card(
    elevation: 2,
    child: Column(
      children: [
        SizedBox(height: screenHeight * 0.008,),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
        ),
        ListTile(
          visualDensity: VisualDensity(vertical: -4),
          title: const Text(
            "Account Name:",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12
            ),
          ),
          trailing: Text(
            name,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w700,
              fontSize: 18
            ),
          ),
        ),
        ListTile(
          visualDensity: VisualDensity(vertical: -4),
          title: const Text(
            "Account No:",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12
            ),
          ),
          trailing: Text(
            number,
            style: const TextStyle(
              color: Colors.orangeAccent,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

class ReloadSolutionsPage extends StatelessWidget {
  const ReloadSolutionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Richway Mobile"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Column(
              children: [
                Icon(Icons.verified_user, size: screenWidth * 0.2),
                SizedBox(height: screenHeight * 0.01,),
                const Text(
                  "Reload Solutions",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Reload Your Wallet Using the Following",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent[400],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                SolutionsCard(
                  screenHeight,
                  "Eastwest Bank",
                  "Richway Solutions INC.",
                  "0008659349329399"
                ),
                SolutionsCard(
                  screenHeight,
                  "Metrobank",
                  "Richway Solutions INC.",
                  "0002837123796128"
                ),
                SolutionsCard(
                  screenHeight,
                  "BDO",
                  "Richway Solutions INC.",
                  "08923812000927838"
                ),
                SolutionsCard(
                  screenHeight,
                  "Union BANK",
                  "Richway Solutions INC.",
                  "0000047847283007"
                ),
                SolutionsCard(
                  screenHeight,
                  "PNB Current Account",
                  "Richway Solutions INC.",
                  "0239238102938102"
                ),
                SolutionsCard(
                  screenHeight,
                  "BDO Kabayan Savings",
                  "Richway Solutions INC.",
                  "1209393838821232"
                ),
                SolutionsCard(
                  screenHeight,
                  "BPI Savings",
                  "Richway Solutions INC.",
                  "0009223381272323"
                ),
                SolutionsCard(
                  screenHeight,
                  "Asia United Bank",
                  "Richway Solutions INC.",
                  "0009223381272323"
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}