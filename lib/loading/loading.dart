import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_sms/flutter_sms.dart';

import '../configurations/settings.dart' as configurations;

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String selectedNetwork = "Choose Network";
  String selectedPromo = "CL";
  bool repeatTransaction = false;
  bool login = false;

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController commandTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  List<String> phoneNumber = [];

  void pickContacts() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();

    setState(() {
      this.phoneNumberTextController.text =
          contact.phoneNumber!.number!.replaceAll(' ', '');
    });

    this.phoneNumber.clear();
    this
        .phoneNumber
        .add(this.phoneNumberTextController.text.replaceAll(' ', ''));
  }

  void sendSMSValue(String command) async {
    String send_result = await sendSMS(
            message: command,
            recipients: [configurations.savedGateWay.replaceAll(' ', '')])
        .catchError((err) {
      print(err + "ERROR");
    });
    print(send_result + "RESULTS");
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Loading"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (phoneNumberTextController.text != "" &&
                commandTextController.text != "") {
              if (repeatTransaction) {
                if (login) {
                  sendSMSValue(
                      "LOGIN REP ${phoneNumberTextController.text} ${commandTextController.text} ${usernameTextController.text} ${passwordTextController.text}");
                } else {
                  sendSMSValue(
                      "REP ${phoneNumberTextController.text} ${commandTextController.text}");
                }
              } else {
                if (login) {
                  sendSMSValue(
                      "LOGIN ${phoneNumberTextController.text} ${commandTextController.text} ${usernameTextController.text} ${passwordTextController.text}");
                } else {
                  sendSMSValue(
                      "${phoneNumberTextController.text} ${commandTextController.text}");
                }
              }
            }
          },
          elevation: 10,
          child: const Icon(Icons.send),
        ),
        body: Center(
            child: ListView(padding: const EdgeInsets.all(25), children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.01),
                InvertColors(
                  child: Image.asset(
                    'assets/images/load.png',
                    width: screenWidth * 0.2,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                const Text(
                  "ILead Loading",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Universal E-Loading",
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
                DropdownButtonFormField(
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                  //value: selectedNetwork,
                  items: configurations.networkList.map((itemone) {
                    return DropdownMenuItem(
                        value: itemone, child: Text(itemone));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedNetwork = value.toString();
                      selectedPromo = "CL";
                    });
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.signal_cellular_alt),
                      labelText: "Network",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w900)),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                DropdownButtonFormField(
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                  value: selectedPromo,
                  items: configurations.promoList
                      .where((item) =>
                          jsonDecode(item)['network'] == selectedNetwork)
                      .map((itemone) {
                    var document = jsonDecode(itemone);
                    return DropdownMenuItem(
                        value: document['command'],
                        child: Text(document['name']));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      commandTextController.text = value.toString();
                      configurations.promoList.forEach((promo) {
                        var promoObject = jsonDecode(promo);
                        if (value.toString() == promoObject['command']) {
                          descriptionTextController.text =
                              promoObject['description'];
                        }
                      });
                      selectedPromo = value.toString();
                    });
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: ImageIcon(
                        AssetImage("assets/images/peso.png"),
                        color: Colors.grey,
                      ),
                      labelText: "Select Load",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w900)),
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
                Row(
                  children: [
                    Switch(
                        value: login,
                        onChanged: (value) {
                          setState(() {
                            login = value;
                          });
                        }),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          login = !login;
                        });
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent[400]),
                      ),
                    ),
                  ],
                ),
                Container(
                    child: login
                        ? TextField(
                            controller: usernameTextController,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.account_circle_outlined),
                                labelText: "Username",
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w900)),
                            onChanged: (text) {
                              setState(() {});
                            },
                          )
                        : null),
                Container(
                    child: login
                        ? TextField(
                            maxLength: 6,
                            controller: passwordTextController,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.password),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w900)),
                          )
                        : null),
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
                        child: Text(
                          commandTextController.text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.8,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          descriptionTextController.text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ])));
  }
}
