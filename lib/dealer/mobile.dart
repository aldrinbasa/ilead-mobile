import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:intl/intl.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {

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
                  Icon(Icons.phone_iphone, size: screenWidth * 0.2,),
                  SizedBox(height: screenHeight * 0.01,),
                  const Text(
                    "Mobile",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Activate a Mobile Stockiest",
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
                  TextField(
                    controller: nameTextController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.account_box),
                      labelText: "Name",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  TextField(
                    controller: birthdayTextController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.date_range),
                      labelText: "Birthday",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now()
                      );

                      if(pickedDate != null){
                        String dateFormatted = DateFormat('MM-dd-yyyy').format(pickedDate);
                        setState(() {
                          birthdayTextController.text = dateFormatted;
                        });
                      }
                    }
                  ),
                  TextField(
                    controller: addressTextController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.home),
                      labelText: "Address",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  TextField(
                    inputFormatters:[FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
                    controller: usernameTextController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                      labelText: "Username",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    maxLength: 6,
                    controller: passwordTextController,
                    keyboardType: const TextInputType.numberWithOptions(),
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