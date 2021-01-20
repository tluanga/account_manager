import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Transaction'),
      ),
      body: Column(
        children: [
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
                    Icon(Icons.arrow_forward_ios_outlined, color: Colors.teal)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
