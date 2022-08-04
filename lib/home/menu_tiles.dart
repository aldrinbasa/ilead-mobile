import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../loading/loading.dart';
import '../wallet/wallet.dart';
import '../others/others.dart';
import '../dealer/dealer_menu.dart';

import '../home/carousel.dart';
import '../services/route_service.dart';

RouteManager routeManager = RouteManager();

class Tiles extends StatefulWidget {
  const Tiles({Key? key}) : super(key: key);

  @override
  State<Tiles> createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  Card loadingCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.purpleAccent,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/load.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Loading",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "All Network Loading",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Card walletCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.redAccent,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/wallet.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Wallet",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Richway Wallet to Wallet Transfer",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Card othersCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.orangeAccent,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/others.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Others",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(6),
          child: const Text(
            "eWallet Balance, PLDT, Cignal, GSat, etc.",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Card dealerCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.blueAccent,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/dealer.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Dealer",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Dealers Access, Network Tools",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Card billsCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.lightBlueAccent,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/bills.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Bills Payment",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Quick and Easy Bills Payment Facility",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Card remittanceCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.lightGreen,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/remittance.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Remittance",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(5),
          child: const Text(
            "Local and International Remittance",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Card organizationCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.indigo,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/organization.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Organization",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(5),
          child: const Text(
            "Manage Network, Encash Rewards Realtime",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Card travelCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.indigoAccent,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/travel.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Travel and Tours",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(5),
          child: const Text(
            "Ticketing Travel Package Tours",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Card mallCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.brown,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/market.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Richway Mall",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(5),
          child: const Text(
            "Buy Anything, Anywhere, and Anytime",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Card pesoCard = Card(
    elevation: 20,
    child: Column(
      children: [
        Container(
          color: Colors.pinkAccent,
          height: 70,
          width: 160,
          child: Image.asset('assets/images/peso.png', scale: 15),
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
          child: const Text(
            "Richway Wallet",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 160,
          height: 60,
          padding: const EdgeInsets.all(5),
          child: const Text(
            "Digital Wallet and a New Kind of Wallet",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    _launchUrl() async {
      final Uri _url = Uri.parse("http://richwayintl.online/");

      if (await canLaunchUrl(_url)) {
        await launchUrl(_url);
      } else {
        throw "Could not launch $_url";
      }
    }

    return ListView(
      children: [
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              ComplicatedImageDemo(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(routeManager.routeTo(() => LoadingPage()));
                },
                child: loadingCard,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(routeManager.routeTo(() => WalletPage()));
                },
                child: walletCard,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(routeManager.routeTo(() => OthersPage()));
                },
                child: othersCard,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(routeManager.routeTo(() => DealerPage()));
                },
                child: dealerCard,
              ),
              // GestureDetector(
              //   onTap: () => print("Bills Payment was Tapped"),
              //   child: billsCard,
              // ),
              // GestureDetector(
              //   onTap: () => print("Remittance was Tapped"),
              //   child: remittanceCard,
              // ),
              GestureDetector(
                onTap: () {
                  _launchUrl();
                },
                child: organizationCard,
              ),
              // GestureDetector(
              //   onTap: () => print("Travel and Tours was Tapped"),
              //   child: travelCard,
              // ),
              // GestureDetector(
              //   onTap: () => print("Richway Mall was Tapped"),
              //   child: mallCard,
              // ),
              // GestureDetector(
              //   onTap: () => print("Richway Wallet was Tapped"),
              //   child: pesoCard,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
