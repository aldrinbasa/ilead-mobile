import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_sms/flutter_sms.dart';

const String contentDummy =
    "Unlimited texts to all networks + 1GB data + 1GB/day of Video Every Day for Youtube, iWant TFC, NBA, Cignal Play. Validity: 3 Days";

final List<String> networkList = [
  "Smart",
  "Globe",
  "Sun Cellular",
  "Talk and Text",
  "Touch Mobile",
  "Dito",
];

final List<String> globeLoadList = [
  "₱10",
  "₱20",
  "₱50",
  "₱100",
  "₱500",
  "₱1000",
  "GoSURF 50",
  "GoSAKTO 100",
];

final List<String> smartLoadList = [
  "₱10",
  "₱20",
  "₱50",
  "₱100",
  "₱500",
  "₱1000",
  "All Text 10",
  "All Text 20",
  "All Text 30",
  "All Text 50",
  "AllData 50",
  "AllData 100",
  "AllData 200",
  "BRO Giga 499",
  "BRO Giga 999",
];

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String selectedNetwork = "Choose Network";
  bool repeatTransaction = false;

  TextEditingController phoneNumberTextController = TextEditingController();
  List<String> phoneNumber = [];


  void pickContacts() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    print(contact);
    setState(() {
      this.phoneNumberTextController.text = contact.phoneNumber!.number!;
    });

    this.phoneNumber.clear();
    this.phoneNumber.add(this.phoneNumberTextController.text.replaceAll(' ', ''));
  }

  void sendSMSValue() async {
    String send_result = await sendSMS(message: "test", recipients: this.phoneNumber)
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
            sendSMSValue();
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
                    // value: selectedNetwork,
                    items: networkList.map((itemone) {
                      return DropdownMenuItem(
                          value: itemone, child: Text(itemone));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedNetwork = value.toString();
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
                    // value: selectedNetwork,
                    items: smartLoadList.map((itemone) {
                      return DropdownMenuItem(
                          value: itemone, child: Text(itemone));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedNetwork = value.toString();
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
                            repeatTransaction.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.8,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            contentDummy,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}
