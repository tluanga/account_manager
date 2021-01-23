import 'package:flutter/material.dart';

class Ledger extends StatelessWidget {
  const Ledger({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text('Ledger Detail'),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(20, (index) => CustomWidget(index)).toList()
          )
        ),
      ],
    );
  }
}

class CustomWidget extends StatelessWidget {
  CustomWidget(this._index) {
    debugPrint('initialize: $_index');
  }

  final int _index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: (_index % 2 != 0) ? Colors.white : Colors.white,
      child: Column(
        children: [
          Center(
              child: Text('index: $_index', style: TextStyle(fontSize: 25))),
        ],
      ),
    );
  }
}