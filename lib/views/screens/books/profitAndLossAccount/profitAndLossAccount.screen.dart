import 'package:account_manager/views/widgets/dateSelector.dart';
import 'package:flutter/material.dart';

class ProfitAndLossScreen extends StatefulWidget {
  @override
  _ProfitAndLossScreenState createState() => _ProfitAndLossScreenState();
}

class _ProfitAndLossScreenState extends State<ProfitAndLossScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'Profit & Loss',
              style: TextStyle(
                fontSize: 18
              ),
            ),
            DateSelector(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              color: Colors.cyan[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Particulars',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}