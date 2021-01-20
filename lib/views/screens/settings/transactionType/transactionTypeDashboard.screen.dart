import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeDashboard.viewmodel.dart';

import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionTypeDashboard extends StatelessWidget {
  const TransactionTypeDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Transaction Type Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Consumer<TransactionTypeDashboardViewModel>(
          builder: (context, transactiontype, child) {
            transactiontype.loadData();
            return ListView.builder(
              itemCount: transactiontype.transactionTypeList.length,
              itemBuilder: (BuildContext context, int index) {
                return TransactionTypeListItem(
                  name: transactiontype.transactionTypeList[index].name,
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(
            context,
            rNewTransactionType,
          )
        },
        child: Text(
          '+',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class TransactionTypeListItem extends StatelessWidget {
  final String name;
  TransactionTypeListItem({this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 10,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.teal[100], blurRadius: 1.0)],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                this.name,
                style: TextStyle(fontSize: 20, color: Color(0xFF757575)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
