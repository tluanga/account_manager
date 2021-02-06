import 'package:account_manager/business_logic/view_models/transaction/assetSelect.viewmodel.dart';

import 'package:account_manager/static/transactionType.constant.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AssetSelectScreen extends StatefulWidget {
  @override
  _AssetSelectScreenState createState() => _AssetSelectScreenState();
}

class _AssetSelectScreenState extends State<AssetSelectScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AssetSelectViewModel>(
        builder: (context, model, child) {
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
                          'Asset Selection Selection',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Search Asset....'),
                    onChanged: (value) => model.setFilteredData(value),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.assetList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (model.assetList[index].id ==
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
                                child: Text(model.assetList[index].name),
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
