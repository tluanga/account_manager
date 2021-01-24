import 'package:account_manager/business_logic/models/companyProfile_model.dart';
import 'package:flutter/foundation.dart';

class CompanyProfileViewModel extends ChangeNotifier {
  List<Company> companyList = [
    Company(name: 'Cash Account'),
    Company(name: 'Machinery Account'),
    Company(name: 'Purchase Account'),
    Company(),
  ];
  void newCompany(Company company) {
    companyList.add(company);
    notifyListeners();
  }

  void removeCompany(int id) {
    // find the leger Master to remove

    // ledgerMasterList.remove(value)
  }
  void findCompany(int id) {
    companyList.where((element) => false);
    notifyListeners();
  }
}
