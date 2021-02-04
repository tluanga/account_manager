import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newSaleTransaction.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class TestTransactionScreen extends StatelessWidget {
  const TestTransactionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Consumer<NewSaleTransactionViewModel>(
                builder: (contex, model, child) {
                  return GestureDetector(
                    onTap: () {
                      model.processMockData();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(
                              color: HexColor(SECONDARYGREYCOLOR),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Test Sale',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor(TEXTCOLOR),
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                  );
                },
              ),
              //-----------Purchase
              Consumer<NewPurchaseTransactionViewModel>(
                builder: (contex, model, child) {
                  return GestureDetector(
                    onTap: () {
                      model.processMockData();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(
                              color: HexColor(SECONDARYGREYCOLOR),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Test Purchase',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor(TEXTCOLOR),
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                  );
                },
              ),
              Consumer<NewSaleTransactionViewModel>(
                builder: (contex, model, child) {
                  return GestureDetector(
                    onTap: () {
                      model.processMockData();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(
                              color: HexColor(SECONDARYGREYCOLOR),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Test OUTWARD',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor(TEXTCOLOR),
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
