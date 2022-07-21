import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:intl/intl.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  final List<String> networkList = [
    "Smart",
    "Globe",
    "Sun Cellular",
    "Talk and Text",
    "Touch Mobile",
    "Dito",
  ];

  String command = "";
  bool repeatTransaction = false;

  TextEditingController transactionNumberTextController = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  TextEditingController timeTextController = TextEditingController();
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
                "Help",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Customer Service Help",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent[400]),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              TextField(
                controller: transactionNumberTextController,
                keyboardType: const TextInputType.numberWithOptions(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Transaction No.",
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
                controller: dateTextController,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.date_range),
                  labelText: "Date",
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
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now()
                  );

                  if(pickedDate != null){
                    String dateFormatted = DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      dateTextController.text = dateFormatted;
                    });
                  }
                }
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              TextField(
                controller: timeTextController,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.timer),
                  labelText: "Time",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
                onTap: () async {
                  TimeOfDay? timePicked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now()
                  );

                  if(timePicked != null){
                    String formattedTime = timePicked.format(context);
                    setState(() {
                      timeTextController.text = formattedTime;
                    });
                  }
                },
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
                    //selectedNetwork = value.toString();
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.signal_cellular_alt),
                  labelText: "Network",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
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