import 'package:flutter/material.dart';

class ChangeAuthenticalPinScreen extends StatelessWidget {
  const ChangeAuthenticalPinScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Authentical Pin'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        height: 500,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // have some bug
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Please Enter Current Authentication Pin',
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Please Enter New Authentication Pin',
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Please Confirm New Authentication Pin',
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  child: Container(
                    width: 300,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
