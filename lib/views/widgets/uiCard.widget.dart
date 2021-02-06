import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UICard extends StatelessWidget {
  final String title;
  final String routeUrl;
  final IconData iconName;

  UICard({this.title, this.routeUrl, this.iconName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeUrl);
        },
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.9), blurRadius: 5)
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(
                iconName,
                size: 50,
                color: HexColor(TEXTCOLOR),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: HexColor(TEXTCOLOR),
                    ),
                  ),
                  // Text('This a Ledger\n'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
