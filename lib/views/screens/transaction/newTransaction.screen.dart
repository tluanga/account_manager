import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Ledger Master'),
      ),
      body: Column(
        children: [
          TextField(),
        ],
      ),
    );
  }
}
