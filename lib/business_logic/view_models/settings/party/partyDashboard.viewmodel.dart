import 'package:account_manager/business_logic/models/party.model.dart';
import 'package:account_manager/services/party/party.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/widgets.dart';

class PartyDashboardViewModel extends ChangeNotifier {
  PartyService _partyService = serviceLocator<PartyService>();

  List<Party> partyList = [];

  // Populate the list
  void loadData() async {
    final _partyList = await _partyService.getList();
    partyList = _partyList;
    notifyListeners();
  }
}
