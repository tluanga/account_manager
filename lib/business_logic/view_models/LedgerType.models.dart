import 'package:account_manager/business_logic/models/ledgerType.models.dart';
import 'package:flutter/foundation.dart';

class LedgerTypeModelView extends ChangeNotifier {
  List<LedgerType> ledgerTypeList = [
    LedgerType(id: 1, name: 'Cash Account'),
    LedgerType(id:2, name:'Machinery Account'),
    LedgerType(id:3, name:'Discount Account'),
  ];
  void newLedgerType(LedgerType ledgerType) {
    ledgerTypeList.add(ledgerType);
  }
}
