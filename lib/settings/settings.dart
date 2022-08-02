import 'dart:io';
import 'package:flutter/material.dart';
import '../services/route_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../configurations/settings.dart' as configurations;
import '../services/data_service.dart' as dataService;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

void _updateSettingsFromFireStore() async {
  CollectionReference ref = FirebaseFirestore.instance.collection('gateways');
  QuerySnapshot eventsQuery = await ref.get();

  configurations.gatewayList.clear();

  eventsQuery.docs.forEach((document) {
    configurations.gatewayList.add(document['phone-number']);
  });
}

class _SettingsPageState extends State<SettingsPage> {
  String? selectedGateway;

  _getSelectedGateWay() async {
    selectedGateway = await dataService.getSavedGateWay();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return (Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
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
                    Icons.settings,
                    size: screenWidth * 0.2,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const Text(
                    "Settings",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Edit mobile app settings (i.e. Gateway)",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent[400]),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Text("Current Gateway"),
                      title: Text(
                        configurations.savedGateWay,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonFormField(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                    //value: configurations.savedGateWay,
                    items: configurations.gatewayList.map((itemone) {
                      return DropdownMenuItem(
                          value: itemone, child: Text(itemone));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        configurations.savedGateWay = value.toString();
                        dataService
                            .saveSavedGateWay(configurations.savedGateWay);
                      });
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.double_arrow_sharp),
                        labelText: "Gateway",
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.w900)),
                  ),
                  Container(
                    height: 50.0,
                    margin: const EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _updateSettingsFromFireStore();
                          configurations.initializeSettings();
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 250.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            "Retrieve Latest Settings",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
