import 'package:account_manager/business_logic/view_models/transaction/newAssetLedgerCreation.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/transactionType.constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
          return SafeArea(
            child: Column(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: HexColor(PRIMARYCOLOR),
                  ),
                )
              ],
            ),
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
                // print(suggestion['id']);
                return ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(suggestion['name']),
                  //   subtitle: Text('\$${suggestion['price']}'),
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
