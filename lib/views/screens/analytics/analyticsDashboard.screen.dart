
import 'package:account_manager/views/screens/analytics/analytic.monthlyTransaction.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart.dart';

class AnalyticsDashboardScreen extends StatelessWidget {
  final List<MonthlyTransactions> data = [
    MonthlyTransactions(
        month: 'January',
        transactions: 120000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue[800])
    ),
    MonthlyTransactions(
        month: 'February',
        transactions: 100000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue[800])
    ),
    MonthlyTransactions(
        month: 'March',
        transactions: 108000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue[800])
    ),
    MonthlyTransactions(
        month: 'April',
        transactions: 100000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue[800])
    ),
    MonthlyTransactions(
        month: 'May',
        transactions: 100000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue[800])
    ),
    MonthlyTransactions(
        month: 'June',
        transactions: 106000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue[800])
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Chart(
          data: data,
        ),
      ),
    );
  }
}
