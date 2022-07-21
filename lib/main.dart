import 'package:flutter/material.dart';

import './home/menu_tiles.dart';
import './home/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ILead Loading'),
          actions: const [Icon(Icons.settings)],
          backgroundColor: Colors.blueAccent,
        ),
        drawer: const Drawer(
          child: MenuDrawer(),
        ),
        body: const Tiles(),
      ),
    );
  }
}