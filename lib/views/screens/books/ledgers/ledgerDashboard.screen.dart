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

  CustomWidget(
    this._index,
    this.ledgerName,
  ) {
    debugPrint('initialize: $_index');
  }

  final int _index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Ledger()));
      },
      child: Container(
        height: 70,
        color: (_index % 2 != 0) ? Colors.white : Colors.white,
        child: Column(
          children: [
            Center(
              child: Text(
                '$ledgerName',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
