import 'package:flutter/material.dart';

import 'package:invert_colors/invert_colors.dart';

import '../services/route_service.dart';
import '../wallet/tu.dart';
import './retailer.dart';
import './distributor.dart';
import './dealer.dart';
import './mobile.dart';
import './city.dart';
import './provincial.dart';
import './additional_account.dart';
import './upgrade.dart';

RouteManager routeManager = RouteManager();

class DealerPage extends StatelessWidget {
  const DealerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Dealer"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Column(
              children: [
                SizedBox(height: screenHeight * 0.01,),
                InvertColors(
                  child: Image.asset(
                    'assets/images/dealer.png',
                    width: screenWidth * 0.2,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01,),
                const Text(
                  "Dealer Menu",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Dealer Access and Network Tools",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent[400]
                  ),
                ),
                SizedBox(height: screenHeight * 0.025,),
                InkWell(
                  onTap: () {Navigator.of(context).push(routeManager.routeTo(() => TUPage()));},
                  child: const ListTile(
                    leading: Icon(Icons.token, color: Colors.blueAccent,),
                    title: Text(
                      "FORWARD TU PINS",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context).push(routeManager.routeTo(() => RetailerPage()));},
                  child: const ListTile(
                    leading: Icon(Icons.checklist, color: Colors.blueAccent,),
                    title: Text(
                      "ACTIVATE RETAILER",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context).push(routeManager.routeTo(() => DistributorPage()));},
                  child: const ListTile(
                    leading: Icon(Icons.account_box_outlined, color: Colors.blueAccent,),
                    title: Text(
                      "ACTIVATE DISTRIBUTOR",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context).push(routeManager.routeTo(() => ActivateDealerPage()));},
                  child: const ListTile(
                    leading: Icon(Icons.account_tree, color: Colors.blueAccent,),
                    title: Text(
                      "ACTIVATE DEALER",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context).push(routeManager.routeTo(() => MobilePage()));},
                  child: const ListTile(
                    leading: Icon(Icons.phone_iphone, color: Colors.blueAccent,),
                    title: Text(
                      "ACTIVATE MOBILE STOCKIEST",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context).push(routeManager.routeTo(() => CityPage()));},
                  child: const ListTile(
                    leading: Icon(Icons.location_city, color: Colors.blueAccent,),
                    title: Text(
                      "ACTIVATE CITY STOCKIEST",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context).push(routeManager.routeTo(() => ProvincialPage()));},
                  child: const ListTile(
                    leading: Icon(Icons.location_on, color: Colors.blueAccent,),
                    title: Text(
                      "ACTIVATE PROVINCIAL STOCKIEST",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context).push(routeManager.routeTo(() => AdditionalAccountPage()));},
                  child: const ListTile(
                    leading: Icon(Icons.add_circle, color: Colors.blueAccent,),
                    title: Text(
                      "ADDITIONAL ACCOUNT",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context).push(routeManager.routeTo(() => UpgradePage()));},
                  child: const ListTile(
                    leading: Icon(Icons.upgrade, color: Colors.blueAccent,),
                    title: Text(
                      "UPGRADE STATUS",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}