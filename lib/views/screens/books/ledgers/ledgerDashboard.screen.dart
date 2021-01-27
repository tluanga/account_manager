import 'package:flutter/material.dart';
import 'package:account_manager/business_logic/view_models/books/ledger/ledgerDashboard.viewmodel.dart';
import 'package:provider/provider.dart';

import 'ledger.screen.dart';

class LedgerDashboard extends StatelessWidget {
  const LedgerDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Consumer<LedgerDashboardViewmodel>(
            builder: (context, model, child) {
          model.loadData();
          return Stack(
            children: [
              CustomScrollView(slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: false,
                  pinned: true,
                  toolbarHeight: 50,
                  expandedHeight: 120,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Ledger Dashboard',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      model.ledgerMasterList.length,
                      (index) => CustomWidget(
                          index, model.ledgerMasterList[index].name),
                    ).toList(),
                  ),
                ),
              ]),
              Positioned(
                left: 10,
                right: 10,
                height: 46,
                // width: MediaQuery.of(context).size.width,
                top: 26,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white))),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final String ledgerName;
  final int totalDebit = 100;
  final int totalCredit = 300;

  CustomWidget(
    this._index,
    this.ledgerName,
  );

  final int _index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Ledger()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: (_index % 2 != 0) ? Colors.white : Colors.grey.shade200,
            border: Border.all(
              color: Colors.amberAccent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$ledgerName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Debit:$totalDebit',
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    Text(
                      'Debit:$totalCredit',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
