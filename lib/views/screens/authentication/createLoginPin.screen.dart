import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CreateLoginPin extends StatelessWidget {

  final String requiredNumber = '1234';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter PIN number',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 30.0),
                PinCodeTextField(
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
                  onCompleted: (value){
                    if(value == requiredNumber){
                      print('valid pin');
                    } else {
                      print('invalid pin');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}