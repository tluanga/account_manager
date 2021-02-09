import 'package:account_manager/static/constants.dart';
import 'package:flutter/widgets.dart';

class BaOrBaloToggleViewModel extends ChangeNotifier {
  int _baOrBalo = cCashDown;
  int _baType = cFullCredit;
  int _amountBankOrCash;
  int _amountParty;

  //-----get and set Ba and Balo
  int getBaOrBalo() => _baOrBalo;
  void setBaOrBalo(int) {
    _baOrBalo = int;
    notifyListeners();
  }

  //-----get and set Ba Type
  // ----possible values 0-FullCredit and 1 -For Partial Credit
  int getBaType() => _baType;
  void setBaType(int _type) {
    _baType = _type;
    notifyListeners();
  }

  int getAmountBankOrCash() => _amountBankOrCash;
  void setAmountBankOrCash(int _type) {
    _amountBankOrCash = _type;
    notifyListeners();
  }

  int getAmountParty() => _amountParty;
  void setAmountParty(int _type) {
    _amountParty = _type;
    notifyListeners();
  }
}
