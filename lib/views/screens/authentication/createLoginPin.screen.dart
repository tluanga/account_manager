import 'package:flutter/material.dart';

class CreateLoginPin extends StatelessWidget {
  const CreateLoginPin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Input 4 Digit pin',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Re Enter 4 Digit pin',
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          child: Text('Submit'),
        ),
      ]),
    );
  }
}
