import 'package:account_manager/business_logic/models/companyProfile_model.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/companyProfile/companyProfile.service.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class NewLedgerMasterViewModel extends ChangeNotifier {
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  CompanyProfileService _companyProfileService =
      serviceLocator<CompanyProfileService>();

  void newLedgerMaster(LedgerMaster data) async {
    var _data = await _ledgerMasterService.insert(data);

    Company _temp = Company(name: 'test');
    var _result = await _companyProfileService.insert(_temp);
    print(_result.toString());
    print(
      _data.toString(),
    );
    notifyListeners();
  }
}
