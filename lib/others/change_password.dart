import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  String command = "";

  TextEditingController usernameTextController = TextEditingController();
  TextEditingController oldPasswordTextController = TextEditingController();
  TextEditingController newPasswordTextController = TextEditingController();
  List<String> phoneNumber = [];

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
        title: const Text("Richway Mobile"),
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
                "CPW",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Change Account Password",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent[400]),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              TextField(
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
                  )
                ),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                maxLength: 6,
                controller: oldPasswordTextController,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.password),
                  labelText: "Old Password",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  )
                ),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                maxLength: 6,
                controller: newPasswordTextController,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.password),
                  labelText: "New Password",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  )
                ),
              ),
              SizedBox(
                height: screenHeight * 0.005,
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
        ],),
      ),
    );
  }
}