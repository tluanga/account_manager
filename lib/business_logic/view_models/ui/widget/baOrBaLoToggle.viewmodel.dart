import 'package:account_manager/static/constants.dart';
import 'package:flutter/widgets.dart';

class BaOrBaloToggleViewModel extends ChangeNotifier {
  int baOrBalo = cCashDown;
  int getBaOrBalo() => baOrBalo;
  void setBaOrBalo(int) {
    baOrBalo = int;
    notifyListeners();
  }
}
