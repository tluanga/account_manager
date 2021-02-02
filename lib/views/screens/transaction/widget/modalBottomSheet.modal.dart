import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/dashboard/dashBoard.screen.dart';
import 'package:account_manager/views/screens/transaction/widget/newParty.modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

void modalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Consumer<NewPurchaseTransactionViewModel>(
              builder: (context, model, child) {
                return Container(
                  height: MediaQuery.of(context).size.height * .90,
                  width: 300,
                  child: Column(
                    children: [
                      Text(
                        'Select Party',
                        style: TextStyle(
                            color: HexColor(TEXTCOLOR),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      // ToggleSwitch(
                      //   minWidth: 120.0,
                      //   minHeight: 40.0,
                      //   activeBgColor: cprimaryColor,
                      //   inactiveBgColor: HexColor(SECONDARYGREYCOLOR),
                      //   activeFgColor: HexColor(TEXTCOLOR),
                      //   initialLabelIndex: 1,
                      //   labels: ['Partial', 'Full'],
                      //   onToggle: (index) {
                      //     model.setBaType(index);
                      //   },
                      // ),
                      // Text('Seleted party Id'),
                      Text(
                        model.getParty().toString(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                            autofocus: true,
                            style: DefaultTextStyle.of(context)
                                .style
                                .copyWith(fontStyle: FontStyle.italic),
                            decoration:
                                InputDecoration(border: OutlineInputBorder())),
                        suggestionsCallback: (pattern) async {
                          List<LedgerMaster> _ledgerMasterList =
                              await model.getFilterdPartyLedgerMaster(pattern);
                          String length = _ledgerMasterList.length.toString();
                          print('The Search yield $length  in the view');
                          return _ledgerMasterList;
                          // return await BackendService.getSuggestions(pattern);
                        },
                        itemBuilder: (context, suggestion){
                          print(suggestion.name.toString());
                          return ListTile(
                            leading: Icon(Icons.shopping_cart),
                            title: Text(suggestion.name.toString()),
                            // subtitle: Text('\$${suggestion['price']}'),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DashBoard()));
                        },
                      ),
                      // Expanded(
                      //   child: ListView.builder(
                      //     itemCount: model.partyList.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Container(
                      //         padding: EdgeInsets.all(5),
                      //         width: MediaQuery.of(context).size.width,
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             model.setParty(model.partyList[index].id);
                      //             Navigator.pop(context);
                      //           },
                      //           child: Container(
                      //             width: 400,
                      //             height: 30,
                      //             decoration: BoxDecoration(
                      //               border: Border.all(
                      //                 color: HexColor(TEXTCOLOR),
                      //               ),
                      //               borderRadius: BorderRadius.circular(10),
                      //             ),
                      //             child: Center(
                      //               child: Text(
                      //                 model.partyList[index].name,
                      //                 style: TextStyle(fontSize: 16),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: HexColor(TEXTCOLOR),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                      color: HexColor(SECONDARYGREYCOLOR),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                color: HexColor(TEXTCOLOR),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    newPartyModal(context);
                                  },
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
