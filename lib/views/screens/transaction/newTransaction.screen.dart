import 'package:account_manager/business_logic/view_models/transaction/newTransaction.viewmodel.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                child: Text(
                  'New Transaction',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Particulars'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, rTransactionTypeSelect);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Select TransationType',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.teal)
                      ],
                    ),
                  ),
                ),
              ),
              Consumer<NewTransactionViewModel>(
                builder: (context, transaction, child) {
                  if (transaction.getSelectedTransacitionType() != 0) {
                    return Container(
                      child: Text(
                        'test',
                      ),
                    );
                  } else
                    return Text('');
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, rNewTransaction);
                  },
                  child: Container(
                    height: 50,
                    width: 420,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
