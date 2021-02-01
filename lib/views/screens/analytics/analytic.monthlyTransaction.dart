import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class MonthlyTransactions {
  final String month;
  final int transactions;
  final charts.Color barColor;

  MonthlyTransactions({
    @required this.month,
    @required this.transactions,
    @required this.barColor
  });
}
