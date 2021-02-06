import 'package:flutter/material.dart';

class PartiesDashBoardScreen extends StatefulWidget {
  @override
  _PartiesDashBoardScreenState createState() => _PartiesDashBoardScreenState();
}

class _PartiesDashBoardScreenState extends State<PartiesDashBoardScreen> {
  String text = 'To be Displayed';

  bool shouldDisplay = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              FlatButton(onPressed: () {
              setState(() {
                shouldDisplay = !shouldDisplay;
              });
            }, child: Text('Add Parties')),
            ]
          ), 
        ),
        shouldDisplay ? Text(text) : Spacer()
      ],
    );
  }
}
