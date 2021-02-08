import 'package:account_manager/business_logic/view_models/dashboard/dashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/dashboard/ledger_mainDashboard.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/dashboard/ledger.widget.dart';
import 'package:account_manager/views/dashboard/transaction.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'parties.dashboard.screen.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    Provider.of<LedgerMainDashboardViewModel>(context, listen: false)
        .loadData();
    Provider.of<DashboardViewModel>(context, listen: false)
        .getTotalTransactionForTheMonth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                "Accounting Application",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "Current Month",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 90.0),
            child: Row(
              children: [
                Expanded(
                  child: Consumer<DashboardViewModel>(
                    builder: (context, model, child) {
                      return Column(
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
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
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
                                            fontSize: 14,
                                            color: Colors.red[700]),
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
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
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
                                            fontSize: 14,
                                            color: Colors.green[800]),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 35,
                            child: TabBar(
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    color: cprimaryColor),
                                tabs: [
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Transactions"),
                                    ),
                                  ),
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Ledgers"),
                                    ),
                                  ),
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Parties"),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TransactionDashboardWidget(),
            LedgerDashboardScreen(),
            PartiesDashBoardScreen()
          ],
        ),
      ),
    );
  }
}
