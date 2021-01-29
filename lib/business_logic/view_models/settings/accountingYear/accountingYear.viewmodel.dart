import 'package:account_manager/business_logic/models/accountingYear_model.dart';
import 'package:account_manager/services/accountingYear/accountingYear.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/widgets.dart';

class AccountingYearViewModel extends ChangeNotifier {
  AccountingYearService _accountingYearService =
      serviceLocator<AccountingYearService>();
  AccountingYear accountingYearData;
  void loadData() async {
    var temp = await _accountingYearService.getList();
    accountingYearData = temp.last;
  }
}
