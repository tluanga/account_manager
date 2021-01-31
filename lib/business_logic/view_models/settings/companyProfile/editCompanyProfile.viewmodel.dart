import 'package:account_manager/business_logic/models/companyProfile_model.dart';
import 'package:account_manager/services/companyProfile/companyProfile.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class EditCompanyProfileViewModel extends ChangeNotifier {
  CompanyProfileService _companyProfile =
      serviceLocator<CompanyProfileService>();

  // enter a new company profile
  
  Future<int> newCompanyProfile(Company company) async {
    Company _companyData = Company(name: 'test', address: '');
    var result = _companyProfile.insert(_companyData);
    return result;
  }
}
