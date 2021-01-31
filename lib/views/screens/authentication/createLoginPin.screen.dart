import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/screens/myApp.screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CreateLoginPin extends StatelessWidget {
  final String requiredNumber = '1234';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 30),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: cprimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36))),
                width: size.width,
                height: size.height * 0.3,
                child: Text(
                  "Login with PIN",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF080040),
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                'Enter PIN number',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                ),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 4,
                  onChanged: (value) {
                    print(value);
                  },
                  pinTheme: PinTheme(
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveColor: Colors.purple,
                    activeColor: Colors.orange,
                    selectedColor: Colors.brown,
                  ),
                  onCompleted: (value) {
                    if (value == requiredNumber) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                      print('valid pin');
                    } else {
                      print('invalid pin');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
