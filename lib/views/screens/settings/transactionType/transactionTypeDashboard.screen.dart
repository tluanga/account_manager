import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionTypeDashboard extends StatelessWidget {
  const TransactionTypeDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Type Dashboard'),
      ),
      body: Consumer<TransactionTypeViewModel>(
        builder: (context, transactiontype, child) {
          return ListView.builder(
            itemCount: transactiontype.transactionTypes.length,
            itemBuilder: (BuildContext context, int index) {
              return TransactionTypeListItem(
                name: transactiontype.transactionTypes[index].name,
              );
            },
          );
        },
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              this.name,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
