import 'package:account_manager/business_logic/models/companyProfile_model.dart';
import 'package:account_manager/services/companyProfile/companyProfile.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class CompanyProfileViewModel extends ChangeNotifier {
  CompanyProfileService _companyProfileService =
      serviceLocator<CompanyProfileService>();

  Company _companyData;

  // enter a new company profile
  void LoadData() async {
    var temp = await _companyProfileService.getCompanyList();
    this._companyData = temp;
    notifyListeners();
  }

  Future<List<Company>> getCompanyList() async {
    var _list = await _companyProfileService.getCompanyList();
    print(_list.toString());
    return _list;
  }
}
