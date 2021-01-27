import 'package:account_manager/views/dashboard/transaction.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  final String title;
  DashBoard({this.title});

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int theriGroupVakue = 0;

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text("Ledgers"),
    1: Text("Transactions"),
    2: Text("Parties")
  };

  static Widget giveCenter(String yourText) {
    return Center(
      child: Text(
        "Text: $yourText",
        style: TextStyle(color: Colors.blue, fontSize: 20.0),
      ),
    );
  }

  static List<Widget> bodies = [
    // First(),
    //---Last 10 transactions
    TransactionDashboardWidget(),
    giveCenter("Search Page"),
    Container(
      child: Text('Hi'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodies[theriGroupVakue],
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Current Month",
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 75.0),
          child: Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              //   padding: EdgeInsets.only(top: 4),
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.cyan, blurRadius: 0.5)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Pek Chhuah',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Rs 2000',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.red[700]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.only(top: 4),
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.cyan, blurRadius: 0.5)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Lakluh',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Rs 5000',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.green[800]),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      CupertinoSegmentedControl(
                        //  borderColor: Colors.red,
                        groupValue: theriGroupVakue,
                        onValueChanged: (changeFromGroupValue) {
                          setState(() {
                            theriGroupVakue = changeFromGroupValue;
                          });
                        },
                        children: logoWidgets,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
