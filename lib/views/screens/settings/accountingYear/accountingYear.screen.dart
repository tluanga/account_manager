import 'package:flutter/material.dart';

class AccountingYearDashboard extends StatefulWidget {
  @override
  _AccountingYearDashboardState createState() =>
      _AccountingYearDashboardState();
}

class _AccountingYearDashboardState extends State<AccountingYearDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text('Accounting Year'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.blue),
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Start Date',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '1 April',
                    style: TextStyle(
                      fontSize: 55,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.blue),
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'End Date',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '31 March',
                    style: TextStyle(
                      fontSize: 55,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'EDIT ACCOUNTING YEAR',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
