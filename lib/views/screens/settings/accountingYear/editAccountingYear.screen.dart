import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class EditAccountingYear extends StatefulWidget {
  const EditAccountingYear({Key key}) : super(key: key);

  @override
  _EditAccountingYearState createState() => _EditAccountingYearState();
}

class _EditAccountingYearState extends State<EditAccountingYear> {
  // final _formKey = GlobalKey<FormState>();

  int _startDate = 1;
  int _startMonth = 1;

  int _endDate = 1;
  int _endMonth = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Edit Accounting Year'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Start Date'),
                      NumberPicker.integer(
                          initialValue: _startDate,
                          minValue: 1,
                          maxValue: 31,
                          onChanged: (newValue) =>
                              setState(() => _startDate = newValue)),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Start Month'),
                      NumberPicker.integer(
                          initialValue: _startMonth,
                          minValue: 1,
                          maxValue: 12,
                          onChanged: (newValue) =>
                              setState(() => _startMonth = newValue)),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('End Date'),
                      NumberPicker.integer(
                          initialValue: _endDate,
                          minValue: 1,
                          maxValue: 31,
                          onChanged: (newValue) =>
                              setState(() => _endDate = newValue)),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('End Month'),
                      NumberPicker.integer(
                          initialValue: _endMonth,
                          minValue: 1,
                          maxValue: 12,
                          onChanged: (newValue) =>
                              setState(() => _endMonth = newValue)),
                    ],
                  ),
                ),
              ],
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
            // Padding(
            //   padding:
            //       EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
            //   child: Container(
            //     width: 300,
            //     height: 60,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       color: Colors.red.shade400,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: Text(
            //       'Clear',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 23,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
