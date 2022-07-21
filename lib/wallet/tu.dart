import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_sms/flutter_sms.dart';

class TUPage extends StatefulWidget {
  const TUPage({Key? key}) : super(key: key);

  @override
  State<TUPage> createState() => _TUPageState();
}

class _TUPageState extends State<TUPage> {
  String command = "";
  bool repeatTransaction = false;

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();
  List<String> phoneNumber = [];


  void pickContacts() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();

    setState(() {
      phoneNumberTextController.text = contact.phoneNumber!.number!;
    });

    phoneNumber.clear();
    phoneNumber.add(phoneNumberTextController.text.replaceAll(' ', ''));
  }

  void sendSMSValue() async {
    String sendResult = await sendSMS(message: "test", recipients: phoneNumber)
      .catchError((err) {
        print(err);
    });
    print(sendResult);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Forward TU Pins"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            sendSMSValue();
          },
          elevation: 10,
          child: const Icon(Icons.send),
        ),
        body: Center(
          child: ListView(padding: const EdgeInsets.all(25), children: [
            Column(
              children: [
                SizedBox(height: screenHeight * 0.01),
                const Text(
                  "TTU",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Transfer of TU Pins",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent[400]),
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                TextField(
                  controller: phoneNumberTextController,
                  keyboardType: const TextInputType.numberWithOptions(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            pickContacts();
                          },
                          icon: const Icon(Icons.contact_phone)),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.phone),
                      labelText: "Phone Number",
                      labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w900)),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                TextField(
                  controller: amountTextController,
                  keyboardType: const TextInputType.numberWithOptions(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.token),
                    labelText: "Pins",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w900
                      ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: repeatTransaction,
                        onChanged: (value) {
                          setState(() {
                            repeatTransaction = value!;
                          });
                        }),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          repeatTransaction = !repeatTransaction;
                        });
                      },
                      child: Text(
                        "Repeat Transaction",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent[400]),
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 1,
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth * 0.8,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black.withOpacity(0.1)))),
                        child: const Text(
                          "Command",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.8,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          command,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]
        )
      )
    );
  }
}
