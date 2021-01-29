import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsDashboard extends StatelessWidget {
  const SettingsDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: HexColor(SECONDARYGREYCOLOR),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.ac_unit),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Balance Sheet'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
