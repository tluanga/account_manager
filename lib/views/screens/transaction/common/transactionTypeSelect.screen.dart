import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/transactionType.constant.dart';
import 'package:account_manager/views/screens/transaction/common/AssetSelectionPage.screen.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class TransactionTypeSelectScreen extends StatefulWidget {
  @override
  _TransactionTypeSelectScreenState createState() =>
      _TransactionTypeSelectScreenState();
}

class _TransactionTypeSelectScreenState
    extends State<TransactionTypeSelectScreen> {
  TransactionTypeSelectViewModel _model =
      serviceLocator<TransactionTypeSelectViewModel>();
  @override
  void initState() {
    super.initState();
    // _model.loadData();
    // _model.printData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TransactionTypeSelectViewModel>(
        builder: (context, model, child) {
          // model.loadData();

          String _length = model.transactionTypeList.toString();
          print('length of transaction typelist inside view is $_length');
          return Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('back'),
                      Center(
                        child: Text(
                          'Transaction Type Selection',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Search Transaction Type....'),
                    onChanged: (value) => model.setFilteredData(value),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.transactionTypeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            model.setSelectedTransactionType(
                                model.transactionTypeList[index]);
                            if (model.transactionTypeList[index].id ==
                                TransactionTypeConstant.cPURCHASEOFASSET) {
                              Navigator.of(context)
                                  .push(new MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                        return new AssetSelectScreen();
                                      },
                                      fullscreenDialog: true));
                            }
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 400,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Center(
                                child:
                                    Text(model.transactionTypeList[index].name),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
