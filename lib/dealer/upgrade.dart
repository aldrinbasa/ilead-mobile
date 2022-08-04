import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_sms/flutter_sms.dart';
import '../configurations/settings.dart' as configurations;

final List<String> networkList = [
  "Distributor",
  "Dealer",
  "Mobile Stockiest",
  "City Stockiest",
  "Provincial Stockiest"
];

class UpgradePage extends StatefulWidget {
  const UpgradePage({Key? key}) : super(key: key);

  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  List<String> phoneNumber = [];
  String command = "";
  String selectedLevel = "";

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController codeTextController = TextEditingController();

  void pickContacts() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    print(contact);
    setState(() {
      phoneNumberTextController.text =
          contact.phoneNumber!.number!.replaceAll(' ', '');
      updateCommand();
    });

    phoneNumber.clear();
    phoneNumber.add(phoneNumberTextController.text.replaceAll(' ', ''));
  }

  void sendSMSValue() async {
    if (selectedLevel != '' && codeTextController.text != '') {
      String send_result = await sendSMS(
          message: command,
          recipients: [configurations.savedGateWay]).catchError((err) {
        print(err + "ERROR");
      });
      print(send_result + "RESULTS");
    }
  }

  void updateCommand() {
    command = "UP${selectedLevel} ${codeTextController.text}";
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dealer Menu"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sendSMSValue();
        },
        elevation: 10,
        child: const Icon(Icons.send),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Icon(
                    Icons.upgrade,
                    size: screenWidth * 0.2,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const Text(
                    "Upgrade Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Level-up Your Account Status",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent[400]),
                  ),
                  // TextField(
                  //   controller: phoneNumberTextController,
                  //   keyboardType: const TextInputType.numberWithOptions(),
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 22,
                  //   ),
                  //   decoration: InputDecoration(
                  //       suffixIcon: IconButton(
                  //         onPressed: () {
                  //           pickContacts();
                  //         },
                  //         icon: const Icon(Icons.contact_phone),
                  //       ),
                  //       border: InputBorder.none,
                  //       prefixIcon: const Icon(Icons.phone),
                  //       labelText: "Phone Number",
                  //       labelStyle: const TextStyle(
                  //           fontSize: 18,
                  //           color: Colors.green,
                  //           fontWeight: FontWeight.w900)),
                  //   onChanged: (text) {
                  //     setState(() {
                  //       updateCommand();
                  //     });
                  //   },
                  // ),
                  DropdownButtonFormField(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                    // value: selectedNetwork,
                    items: networkList.map((itemone) {
                      return DropdownMenuItem(
                          value: itemone.split(" ")[0].toUpperCase(),
                          child: Text(itemone));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLevel = value.toString();
                        updateCommand();
                      });
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.corporate_fare),
                      labelText: "Level",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  TextField(
                    controller: codeTextController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.numbers),
                      labelText: "Activation Code",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w900),
                    ),
                    onChanged: (text) {
                      setState(() {
                        updateCommand();
                      });
                    },
                  ),
                  Text(command)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
