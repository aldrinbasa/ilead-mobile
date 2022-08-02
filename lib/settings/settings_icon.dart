import 'package:flutter/material.dart';
import '../services/route_service.dart';
import './settings.dart';

RouteManager routeManager = RouteManager();

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.of(context)
            .push(routeManager.routeTo(() => const SettingsPage()));
      },
    ));
  }
}
