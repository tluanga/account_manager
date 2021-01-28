import 'package:flutter/material.dart';

class ToggleWidget extends StatelessWidget {
  final String option1Label;
  final String option2Label;
  final int selectedIndex;
  final Color option1BorderColor = null;
  final Color option2BorderColor = null;

  const ToggleWidget({
    Key key,
    this.selectedIndex,
    this.option1Label,
    this.option2Label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == 0) {}
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 165,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                option1Label,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 50,
            width: 165,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(option2Label),
            ),
          ),
        ],
      ),
    );
  }
}
