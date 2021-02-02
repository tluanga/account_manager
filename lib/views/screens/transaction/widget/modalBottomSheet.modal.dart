import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
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
                  height: MediaQuery.of(context).size.height * .60,
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
                      ToggleSwitch(
                        minWidth: 120.0,
                        minHeight: 40.0,
                        activeBgColor: cprimaryColor,
                        inactiveBgColor: HexColor(SECONDARYGREYCOLOR),
                        activeFgColor: HexColor(TEXTCOLOR),
                        initialLabelIndex: 1,
                        labels: ['Partial', 'Full'],
                        onToggle: (index) {
                          model.setBaType(index);
                        },
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
                          itemCount: model.partyList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width,
                              child: GestureDetector(
                                onTap: () {
                                  model.setParty(model.partyList[index].id);
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
                                      model.partyList[index].name,
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
                                  'Select',
                                  style: TextStyle(
                                    color: HexColor(SECONDARYGREYCOLOR),
                                    fontSize: 20,
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
                                child: Text(
                                  'Add New',
                                  style: TextStyle(
                                    color: HexColor(SECONDARYGREYCOLOR),
                                    fontSize: 20,
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
