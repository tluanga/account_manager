import 'package:account_manager/business_logic/view_models/ledgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newAssetLedgerCreation.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/transactionType.constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
                                        '_labelText',
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
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new AddEntryDialog();
      },
      fullscreenDialog: false));
}

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Select Asset Ledger'),
      ),
      body: Consumer<TransactionTypeSelectViewModel>(
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  autofocus: true,
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontStyle: FontStyle.italic),
                  decoration: InputDecoration(border: OutlineInputBorder())),
              suggestionsCallback: (pattern) async {
                return await model.getFilteredLedgerMaster(pattern);
              },
              itemBuilder: (context, suggestion) {
                print(suggestion['id']);
                // return ListTile(
                //   leading: Icon(Icons.shopping_cart),
                //   title: Text(suggestion['name']),
                //   subtitle: Text('\$${suggestion['price']}'),
                // );
                return ListTile(
                  title: Text('test'),
                );
              },
              onSuggestionSelected: (suggestion) {
                Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => ProductPage(product: suggestion)
                // ));
              },
            ),
          );
        },
      ),
    );
  }
}

//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: SingleChildScrollView(
//             child: Consumer<TransactionTypeSelectViewModel>(
//               builder: (context, model, child) {
//                 model.loadAssetTypeLedger();
//                 return TypeAheadField(
//                   textFieldConfiguration: TextFieldConfiguration(
//                       autofocus: true,
//                       style: DefaultTextStyle.of(context)
//                           .style
//                           .copyWith(fontStyle: FontStyle.italic),
//                       decoration:
//                           InputDecoration(border: OutlineInputBorder())),
//                   suggestionsCallback: (pattern) async {
//                     return await model.getFilteredLedgerMaster(pattern);
//                   },
//                   itemBuilder: (context, suggestion) {
//                     return ListTile(
//                       leading: Icon(Icons.shopping_cart),
//                       title: Text(suggestion['name']),
//                       subtitle: Text('\$${suggestion['price']}'),
//                     );
//                   },
//                   onSuggestionSelected: (suggestion) {
//                     Navigator.pop(context);
//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //   builder: (context) => ProductPage(product: suggestion)
//                     // ));
//                   },
//                 );
//               },
//             ),
//           ),
//         );
//       });
// }

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
                  height: MediaQuery.of(context).size.height * .60,
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
