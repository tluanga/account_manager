import 'package:account_manager/business_logic/models/count.models.dart';
import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/widgets/uiCard.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UICard(
              title: 'Settings',
              routeUrl: rSettingsDashboard,
            ),
          ],
        ),
      ),
    );
  }
}
