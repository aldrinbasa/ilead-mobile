library ilead_mobile.settings;

import '../services/data_service.dart' as dataService;

List<String> gatewayList = [];
List<String> networkList = [];
List<String> promoList = [];
String savedGateWay = "09289216384";

void initializeSettings() {
  dataService.getSavedGateWay()!;
  dataService.getNetwork()!;
  dataService.getPromos()!;
  dataService.getGateWaylist()!;
}
