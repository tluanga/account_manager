import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTransactionType extends StatelessWidget {
  const NewTransactionType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' New Transaction Type'),
      ),
      body: Consumer<TransactionTypeViewModel>(
          builder: (context, transactiontype, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, rLedgerSelect);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Select Ledgers',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.arrow_forward_ios_outlined, color: Colors.blue)
                    ],
                  ),
                ),
              ),
            ),
            Consumer<TransactionTypeViewModel>(
              builder: (context, transactionType, child) {
                return Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                  ),
                  child: ListView.builder(
                    itemCount: transactionType.ledgers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text('test');
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
