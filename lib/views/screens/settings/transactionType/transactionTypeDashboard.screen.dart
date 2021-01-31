import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeDashboard.viewmodel.dart';

import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/screens/settings/transactionType/transactionTypeDetail.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionTypeDashboard extends StatelessWidget {
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
            print(transactiontype.transactionTypeList.length.toString());
            return ListView.builder(
              itemCount: transactiontype.transactionTypeList.length,
              itemBuilder: (BuildContext context, int index) {
                return TransactionTypeListItem(
                  transactionType: transactiontype.transactionTypeList[index],
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
  final TransactionType transactionType;

  TransactionTypeListItem({this.transactionType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionTypeDetailScreen(
              transactionType: this.transactionType,
            ),
          ),
        );
      },
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
                this.transactionType.name,
                style: TextStyle(fontSize: 20, color: Color(0xFF757575)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
