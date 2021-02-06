import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime startDate = DateTime.now();

  DateTime endDate = DateTime.now();

  int valueSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      DropdownButton(
        value: valueSelected,
        items: [
          DropdownMenuItem(
            child: Text('Today'),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text(
              'This Week',
              style: TextStyle(color: Colors.black),
            ),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text('This Month'),
            value: 3,
          ),
          DropdownMenuItem(
            child: Text('This Fin Year'),
            value: 4,
          ),
        ],
        onChanged: (value) {
          setState(() {
            valueSelected = value;
            if (value == 1) {
              startDate = DateTime.now();
            }
            if (value == 2) {
              startDate = DateTime.now()
                  .subtract(Duration(days: DateTime.now().weekday));
            }
            if (value == 3) {
              startDate = new DateTime(endDate.year, endDate.month, 1);
            }
            if (value == 4) {
              startDate = DateTime(startDate.year, 01, 01);
            }
          });
        },
      ),
      Icon(
        Icons.calendar_today_outlined,
        size: 15,
      ),
      Text(
        DateFormat('dd/MM/yyyy').format(startDate),
        style: TextStyle(fontSize: 15),
      ),
      Text(
        'to',
        style: TextStyle(fontSize: 15),
      ),
      Text(
        DateFormat('dd/MM/yyyy').format(endDate),
        style: TextStyle(fontSize: 15),
      ),
    ]);
  }
}