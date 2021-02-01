import 'package:account_manager/views/screens/analytics/analytic.monthlyTransaction.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Chart extends StatelessWidget {
  final List<MonthlyTransactions> data;

  Chart({
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    List<charts.Series<MonthlyTransactions, String>> series = [
      charts.Series(
          id: 'Transactions',
          data: data,
          domainFn: (MonthlyTransactions transac, _) => transac.month,
          measureFn: (MonthlyTransactions transac, _) => transac.transactions,
          colorFn: (MonthlyTransactions transac, _) => transac.barColor)
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: [
            Text('Transactions from the month of January to June'),
            Expanded(child: charts.BarChart(series, animate: true,))
          ],
        ),
      ),
    );
  }
}
