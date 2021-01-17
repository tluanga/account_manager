import 'package:account_manager/business_logic/models/count.models.dart';
import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/widgets/uiCard.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsDashboard extends StatelessWidget {
  const SettingsDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Dashboard'),
      ),
      body: Column(
        children: [
          UICard(
            title: 'Ledger Master',
            routeUrl: rLedgerMasterDashboard,
          )
          // Consumer<Count>(
          //   builder: (context, count, child) {
          //     return Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: GestureDetector(
          //         onTap: () {
          //           count.setCount(100 + 1);

          //           // Navigator.pop(context);
          //         },
          //         child: Container(
          //           width: 100,
          //           height: 100,
          //           decoration: BoxDecoration(
          //             color: Colors.amber.shade300,
          //           ),
          //           child: Text('Set Count to 8000'),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          // Consumer<Count>(
          //   builder: (context, count, child) {
          //     return Text(
          //       count.a.toString(),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
