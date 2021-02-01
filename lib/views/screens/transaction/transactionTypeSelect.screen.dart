import 'package:account_manager/business_logic/view_models/ledgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newAssetLedgerCreation.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/transactionType.constant.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
                      _labelText = 'Hralh';
                    }
                    return Padding(
                      padding: EdgeInsets.all(6),
                      child: GestureDetector(
                        onTap: () {
                          _modalBottomSheet(context);
                          if (model.transactionTypeList[index].id ==
                              TransactionTypeConstant.cPURCHASEOFASSET) {
                            // if the selected type is purchase of asset-> we have to select or create new asset
                            // task: create a asset variable in master ledger to identity the asset ledger.
                            // call the asset ledger selection
                            _modalBottomSheet(context);
                            print('Asset Type Selected');
                          } else {
                            Navigator.pop(context);
                          }

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

void _modalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Consumer<TransactionTypeSelectViewModel>(
              builder: (context, model, child) {
                model.loadAssetTypeLedger();
                return Container(
                  height: MediaQuery.of(context).size.height * .60,
                  width: 300,
                  child: Column(
                    children: [
                      Text(
                        'Select Asset Ledger',
                        style: TextStyle(
                            color: HexColor(TEXTCOLOR),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search by Name...',
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: model.assetTypeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width,
                              child: GestureDetector(
                                onTap: () {
                                  model.setAssetLedger(
                                      model.assetTypeList[index]);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 400,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: HexColor(TEXTCOLOR),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      model.assetTypeList[index].name,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                color: HexColor(TEXTCOLOR),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: HexColor(SECONDARYGREYCOLOR),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _newAssetLedgermodalBottomSheet(context);
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: HexColor(TEXTCOLOR),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Add New',
                                    style: TextStyle(
                                      color: HexColor(SECONDARYGREYCOLOR),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      });
}

void _newAssetLedgermodalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Consumer<NewAssetLedgerCreationViewModel>(
              builder: (context, model, child) {
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      // --All asset are of direct expense
                      Text(
                        'New Asset Ledger Creation',
                        style: TextStyle(
                          color: HexColor(TEXTCOLOR),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          model.setName(value);
                        },
                        decoration: InputDecoration(labelText: 'Name of Asset'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          model.setDescription(value);
                        },
                        decoration: InputDecoration(labelText: 'Description'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              int result = await model.newAssetLedger();

                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                color: HexColor(TEXTCOLOR),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: HexColor(SECONDARYGREYCOLOR),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                color: HexColor(TEXTCOLOR),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: HexColor(SECONDARYGREYCOLOR),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      });
}
