import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_sms/flutter_sms.dart';

class AdditionalAccountPage extends StatefulWidget {
  const AdditionalAccountPage({Key? key}) : super(key: key);

  @override
  State<AdditionalAccountPage> createState() => _AdditionalAccountPageState();
}

class _AdditionalAccountPageState extends State<AdditionalAccountPage> {

  List<String> phoneNumber = [];

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController codeTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController birthdayTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();

  void pickContacts() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    print(contact);
    setState(() {
      phoneNumberTextController.text = contact.phoneNumber!.number!;
    });

    phoneNumber.clear();
    phoneNumber.add(phoneNumberTextController.text.replaceAll(' ', ''));
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
                  SizedBox(height: screenHeight * 0.01,),
                  Icon(Icons.add_circle, size: screenWidth * 0.2,),
                  SizedBox(height: screenHeight * 0.01,),
                  const Text(
                    "Additional Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Add Another Account to Your Name",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent[400]
                    ),
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
                        onPressed: () {pickContacts();},
                        icon: const Icon(Icons.contact_phone),
                      ),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.phone),
                      labelText: "Phone Number",
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w900
                      )
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
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}