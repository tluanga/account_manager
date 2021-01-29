import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceSheetScreen extends StatefulWidget {
  BalanceSheetScreen({Key key}) : super(key: key);

  @override
  _BalanceSheetScreenState createState() => _BalanceSheetScreenState();
}

class _BalanceSheetScreenState extends State<BalanceSheetScreen> {

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  int valueSelected = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  'Balance Sheet',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.picture_as_pdf,
                ),
              ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              DropdownButton(
                value: valueSelected,
                items: [
                  DropdownMenuItem(
                    child: Text('Today'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('This Week'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('This Month'),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text('This Financial Year'),
                    value: 4,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    valueSelected = value;
                    if (value == 1) {
                      startDate = DateTime.now();
                    }
                    if (value == 2) {
                      startDate = DateTime.now()
                          .subtract(Duration(days: DateTime.now().weekday));
                    }
                    if (value == 3) {
                      startDate =
                          new DateTime(endDate.year, endDate.month, 1);
                    }
                    if (value == 4) {
                      startDate = DateTime(startDate.year, 01, 01);
                    }
                  });
                },
              ),
              Icon(Icons.calendar_today_outlined),
              Text(
                DateFormat('dd/MM/yyyy').format(startDate),
              ),
              Text('to'),
              Text(
                DateFormat('dd/MM/yyyy').format(endDate),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.cyan[50],
                      child: Text(
                        'Assets',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: cprimaryColor,fontWeight: FontWeight.w500, fontSize: 18),
                      )
                    )
                  ),
                  VerticalDivider(width: 2,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.cyan[50],
                      child: Text(
                        'Liabilities',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w500, fontSize: 18),
                      )
                    )
                  ),
                ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Current Assets',style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Amount', style: TextStyle(fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Cash in hand',style: TextStyle(color: Colors.grey[700])),
                  Text('2000.00', style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500),)
                ],
              ),
            )
          ],
        ),
       ),
    );
  }
}