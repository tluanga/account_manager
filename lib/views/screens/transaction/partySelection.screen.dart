import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PartySelectionScreen extends StatelessWidget {
  const PartySelectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Header
          Container(
            child: Column(
              children: [
                Text(
                  'Please Select Party',
                  style: TextStyle(
                    color: HexColor(TEXTCOLOR),
                  ),
                )
              ],
            ),
          ),
          //Content
        ],
      ),
    );
  }
}
