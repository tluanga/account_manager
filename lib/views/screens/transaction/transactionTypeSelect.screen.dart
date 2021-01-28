import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class TransactionTypeSelectScreen extends StatefulWidget {
  const TransactionTypeSelectScreen({Key key}) : super(key: key);

  @override
  _TransactionTypeSelectScreenState createState() =>
      _TransactionTypeSelectScreenState();
}

class _TransactionTypeSelectScreenState
    extends State<TransactionTypeSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TransactionTypeSelectViewModel>(
        builder: (context, model, child) {
          model.loadData();
          return Column(
            children: [
              Container(
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor('#FBAF02'),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Please select Transaction Type',
                          style: TextStyle(
                            fontSize: 20,
                            color: HexColor(TEXTCOLOR),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                labelStyle: TextStyle(
                                  color: HexColor(
                                    TEXTCOLOR,
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.transactionTypeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Color _labelColor;
                    String _labelText;
                    if (model.transactionTypeList[index].sumChetVelDanType ==
                        cHRALH) {
                      _labelColor = Colors.blue.shade400;
                      _labelText = 'Pekchhuah';
                    }
                    return Padding(
                      padding: EdgeInsets.all(6),
                      child: GestureDetector(
                        onTap: () {
                          if (model.selectedTransactionType == null) {
                            model.selectedTransactionType =
                                model.transactionTypeList[index];
                            Navigator.pop(context);
                          } else {
                            model.selectedTransactionType =
                                model.transactionTypeList[index];
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: _labelColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        _labelText,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.transactionTypeList[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        model.transactionTypeList[index]
                                            .description,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
