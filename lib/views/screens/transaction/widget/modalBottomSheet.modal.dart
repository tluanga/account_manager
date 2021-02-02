import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/dashboard/dashBoard.screen.dart';
import 'package:account_manager/views/screens/transaction/widget/newParty.modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

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
                        itemBuilder: (context, suggestion) {
                          String _name = suggestion.name.toString();
                          return ListTile(
                            title: Text(_name),
                            // subtitle: Text('\$${suggestion['price']}'),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          print(suggestion.id.toString());
                          model.setPartyId(suggestion.id);
                          model.setPartyName(suggestion.name);

                          Navigator.pop(context);
                        },
                      ),
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
