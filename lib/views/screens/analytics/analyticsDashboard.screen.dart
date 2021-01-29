import 'package:flutter/material.dart';

class AnalyticsDashboardScreen extends StatefulWidget {
  AnalyticsDashboardScreen({Key key}) : super(key: key);

  @override
  _AnalyticsDashboardScreenState createState() =>
      _AnalyticsDashboardScreenState();
}

class _AnalyticsDashboardScreenState extends State<AnalyticsDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Analytics Screen'),
        ],
      ),
    );
  }
}
