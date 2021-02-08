import 'package:account_manager/static/constants.dart';
import 'package:flutter/widgets.dart';

class BaOrBaloToggleViewModel extends ChangeNotifier {
  int _baOrBalo = cCashDown;
  int _baType = cFullCredit;

  //-----get and set Ba and Balo
  int getBaOrBalo() => _baOrBalo;
  void setBaOrBalo(int) {
    _baOrBalo = int;
    notifyListeners();
  }

  //-----get and set Ba Type
  // ----possible values 0-FullCredit and 1 -For Partial Credit
  void getBaType() => _baType;
  void setBaType(int _type) {
    _baType = _type;
    notifyListeners();
  }
}
