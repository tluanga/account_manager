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
              Padding(
                padding: const EdgeInsets.only(top:24),
                child: CustomScrollView(slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    floating: false,
                    pinned: true,
                    toolbarHeight: 30,
                    expandedHeight: 120,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        'Ledger Dashboard',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      List.generate(
                        model.ledgerMasterList.length,
                        (index) => CustomWidget(
                          index: index,
                          ledgerName: model.ledgerMasterList[index].name,
                          ledgerId: model.ledgerMasterList[index].id,
                          totalCredit: 0,
                          totalDebit: 0,
                        ),
                      ).toList(),
                    ),
                  ),
                ]),
              ),
              // Positioned(    // include this widget when we can impliment search
              //   left: 10,
              //   right: 10,
              //   height: 46,
              //   // width: MediaQuery.of(context).size.width,
              //   top: 26,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 20,
              //       vertical: 5,
              //     ),
              //     decoration: BoxDecoration(
              //         color: Colors.grey[400],
              //         borderRadius: BorderRadius.circular(10)),
              //     child: TextField(
              //         cursorColor: Colors.white,
              //         style: TextStyle(color: Colors.white),
              //         decoration: InputDecoration(
              //             enabledBorder: InputBorder.none,
              //             focusedBorder: InputBorder.none,
              //             icon: Icon(
              //               Icons.search,
              //               color: Colors.white,
              //             ),
              //             hintText: 'Search',
              //             hintStyle: TextStyle(color: Colors.white))),
              //   ),
              // )
            ],
          );
        }),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final int index;
  final int ledgerId;
  final String ledgerName;
  final int totalDebit;
  final int totalCredit;

  CustomWidget({
    this.index,
    this.ledgerId,
    this.ledgerName,
    this.totalDebit,
    this.totalCredit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Ledger(
              ledgerId: ledgerId,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: (index % 2 != 0) ? Colors.white : Colors.grey.shade200,
            border: Border.all(
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$ledgerName',
                style: TextStyle(
                  fontSize: 16,
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
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    Text(
                      'Debit:$totalCredit',
                      style: TextStyle(fontSize: 14, color: Colors.red),
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
