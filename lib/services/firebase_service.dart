import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../configurations/settings.dart' as configurations;
import '../services/data_service.dart' as data_service;

void retrieveAllDataFromFireStore() {
  updateGateWaysFromFireStore();
  updateNetworksFromFireStore();
  updatePromosFromFireStore();
}

void updateGateWaysFromFireStore() async {
  CollectionReference ref = FirebaseFirestore.instance.collection('gateways');
  QuerySnapshot eventsQuery = await ref.get();

  configurations.gatewayList.clear();

  eventsQuery.docs.forEach((document) {
    configurations.gatewayList.add(document['phone-number']);
  });

  data_service.saveGateWayList(configurations.gatewayList);
}

void updateNetworksFromFireStore() async {
  CollectionReference ref = FirebaseFirestore.instance.collection('networks');
  QuerySnapshot eventsQuery = await ref.get();

  configurations.networkList.clear();

  eventsQuery.docs.forEach((document) {
    configurations.networkList.add(document['network']);
  });

  data_service.saveNetwork(configurations.networkList);
}

void updatePromosFromFireStore() async {
  CollectionReference ref = FirebaseFirestore.instance.collection('promos');
  QuerySnapshot eventsQuery = await ref.get();

  configurations.promoList.clear();

  eventsQuery.docs.forEach((document) {
    Map<String, dynamic> user = {
      'name': document['name'],
      'command': document['command'],
      'description': document['description'],
      'network': document['network']
    };

    configurations.promoList.add(jsonEncode(user));
  });

  data_service.savePromos(configurations.promoList);
}
