import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:account_manager/views/widgets/my_text_box.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextBox(
              title: 'Name',
            ),
            MyTextBox(
              title: 'Description',
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, rLedgerSelect);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
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
                            'Select Ledgers',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.arrow_forward_ios_outlined, color: Colors.teal)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Theme.of(context).primaryColor,
                onPressed: (){}, 
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ),
            )
          ],
        );
      }),
    );
  }
}

