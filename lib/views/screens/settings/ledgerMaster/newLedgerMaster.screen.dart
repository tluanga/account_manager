import 'package:account_manager/views/widgets/my_text_box.dart';
import 'package:flutter/material.dart';

class NewLedgerMaster extends StatelessWidget {
  final String name;

  NewLedgerMaster({this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Ledger Master'),
        ),
        body: Column(
          children: [
            MyTextBox(
              title: 'Name',
            ),
            MyTextBox(
              title: 'Description',
            )
          ],
        )
      ),
    );
  }
}
