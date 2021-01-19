import 'package:account_manager/static/search_bar.dart';
import 'package:flutter/material.dart';

class LedgerDashboard extends StatelessWidget {
  const LedgerDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
      centerTitle: true,
      title: Text('Ledger Dashboard'),
          ),
          body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchBar(),
        ],
      ),
          ),
        ),
    );
  }
}

