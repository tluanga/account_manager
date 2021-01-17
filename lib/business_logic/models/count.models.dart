import 'package:flutter/widgets.dart';

class Count extends ChangeNotifier {
  int a = 1000;
  Count({this.a});
  void setCount(int _value) {
    this.a = _value;
    notifyListeners();
  }

  int readCount() {
    return this.a;
  }
}
