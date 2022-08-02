import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ilead_mobile/settings/settings_icon.dart';

import './home/menu_tiles.dart';
import './home/drawer.dart';
import './settings/settings.dart';
import './services/route_service.dart';
import './loading/loading.dart';
import './services/data_service.dart' as data_service;
import './configurations/settings.dart' as configurations;
import './services/firebase_service.dart' as firebase_service;

RouteManager routeManager = RouteManager();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //data_service.getNetwork();

  firebase_service.retrieveAllDataFromFireStore();
  configurations.initializeSettings();

  runApp(const MyApp());
}

// Stream<List<String>> readGateways() => FirebaseFirestore.instance
//     .collection('gateways')
//     .snapshots()
//     .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

getGateWays() async {
  final CollectionReference _gateways =
      FirebaseFirestore.instance.collection('gateways');
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // final CollectionReference _gateways =
    //     FirebaseFirestore.instance.collection('gateways');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ILead Loading'),
          actions: const [SettingsIcon()],
          backgroundColor: Colors.blueAccent,
        ),
        drawer: const Drawer(
          child: MenuDrawer(),
        ),
        // body: StreamBuilder(
        //   stream: _gateways.snapshots(),
        //   builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        //     if (streamSnapshot.hasData) {
        //       return ListView.builder(
        //         itemBuilder: (context, index) {
        //           final DocumentSnapshot documentSnapshot =
        //               streamSnapshot.data!.docs[index];
        //           return Text(documentSnapshot['phone-number']);
        //         },
        //       );
        //     }
        //     return const Center(child: CircularProgressIndicator());
        //   },
        // ),
        body: const Tiles(),
      ),
    );
  }
}
