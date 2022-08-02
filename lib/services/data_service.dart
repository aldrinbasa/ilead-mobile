import 'package:flutter/material.dart';
import '../configurations/settings.dart' as configurations;
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _preferences = SharedPreferences.getInstance();

// GATEWAY LIST
Future<void> saveGateWayList(List<String> gatewayList) async {
  final SharedPreferences sharedPreferences = await _preferences;

  await sharedPreferences.setStringList("gateway-list", gatewayList);
}

getGateWaylist() async {
  final SharedPreferences sharedPreferences = await _preferences;

  final List<String>? savedGateWayList =
      sharedPreferences.getStringList("gateway-list");

  configurations.gatewayList = savedGateWayList!;
}

// SAVED GATEWAY
Future<void> saveSavedGateWay(String phoneNumber) async {
  final SharedPreferences sharedPreferences = await _preferences;

  await sharedPreferences.setString("saved-gateway", phoneNumber);
}

getSavedGateWay() async {
  final SharedPreferences sharedPreferences = await _preferences;

  final String? savedGateWay = sharedPreferences.getString("saved-gateway");

  configurations.savedGateWay = savedGateWay!;
}

// GATEWAY ONE
Future<String?> getGateWayOne() async {
  final SharedPreferences sharedPreferences = await _preferences;

  final String? gatewayOne = sharedPreferences.getString("gateway-one");
  return gatewayOne;
}

Future<void> saveGateWayOne(String phoneNumber) async {
  final SharedPreferences sharedPreferences = await _preferences;

  await sharedPreferences.setString("gateway-one", phoneNumber);
}

// GATEWAY TWO
Future<String?> getGateWayTwo() async {
  final SharedPreferences sharedPreferences = await _preferences;

  final String? gatewayOne = sharedPreferences.getString("gateway-two");
  return gatewayOne;
}

Future<void> saveGateWayTwo(String phoneNumber) async {
  final SharedPreferences sharedPreferences = await _preferences;

  await sharedPreferences.setString("gateway-two", phoneNumber);
}

// NETWORK
Future<void> saveNetwork(List<String> networkList) async {
  final SharedPreferences sharedPreferences = await _preferences;

  await sharedPreferences.setStringList("networks", networkList);
}

getNetwork() async {
  final SharedPreferences sharedPreferences = await _preferences;

  final List<String>? networkList = sharedPreferences.getStringList("networks");

  configurations.networkList = networkList!;
}

// PROMO
getPromos() async {
  final SharedPreferences sharedPreferences = await _preferences;

  final List<String>? promoList = sharedPreferences.getStringList("promos");

  configurations.promoList = promoList!;
}

Future<void> savePromos(List<String> promoList) async {
  final SharedPreferences sharedPreferences = await _preferences;

  await sharedPreferences.setStringList("promos", promoList);
}
