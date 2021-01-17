import 'package:flutter/material.dart';

class UICard extends StatelessWidget {
  final String title;
  final String routeUrl;
  final IconData iconName;

  UICard({this.title, this.routeUrl, this.iconName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeUrl);
        },
        child: Material(
          borderRadius: BorderRadius.circular(25),
          elevation: 20,
          child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
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
                ],
                borderRadius: BorderRadius.circular(25),
                // border: Border.all(color: Colors.teal),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconName,
                    size: 40,
                    color: Colors.teal.shade300,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff4F665E),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
