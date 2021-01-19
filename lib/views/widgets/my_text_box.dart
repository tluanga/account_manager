import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String title;
  final String routeUrl;

  MyTextBox({this.title, this.routeUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 20,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.teal.shade100,
                blurRadius: 1.0, // soften the shadow
                // spreadRadius: 2.0, //extend the shadow
                offset: Offset(
                  3.0, // Move to right 10  horizontally
                  3.0, // Move to bottom 10 Vertically
                ),
              )
            ],                // border: Border.all(color: Colors.teal),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:20.0),
            child: TextFormField(
                decoration: InputDecoration(                
                labelText: title,
                border: InputBorder.none
              ),
            ),
          ),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       iconName,
            //       size: 40,
            //       color: Colors.teal.shade300,
            //     ),
            //     Text(
            //       title,
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         color: Color(0xff4F665E),
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ],
            // )
        ),
      ),
    );
  }
}
