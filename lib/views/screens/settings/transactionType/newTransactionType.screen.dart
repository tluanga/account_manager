import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class NewTransactionType extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

List<String> localData = ['Purchase Account','Sales account', 'Machinery'];

class _AppState extends State<NewTransactionType> {
  Map<String, String> selectedValueMap = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewTransactionTypeViewModel>(
        builder: (context, transactionType, child) {
          return SafeArea(
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: Container(
                    child: Center(
                      child: Text(
                        'New Transaction Type',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green[300])
                  ),
                  child:getSearchableDropdown(localData, "local"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        rCreditSideLedger,
                        arguments: CREDIT,
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green.shade300,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Select Credit Side Ledger'),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      rTransactionTypeDashboard,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 420,
                      decoration: BoxDecoration(
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
          // return Stack(
          //   children: [
          //     Text(
          //       transactionType.getSelectedLedger().length.toString(),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.pushNamed(context, rLedgerSelect);
          //       },
          //       child: Padding(
          //         padding: const EdgeInsets.all(15.0),
          //         child: Container(
          //           padding: EdgeInsets.symmetric(horizontal: 20),
          //           height: 50,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: Colors.teal),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Expanded(
          //                 child: Center(
          //                   child: Text(
          //                     'Select Ledgers',
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 20,
          //               ),
          //               Icon(Icons.arrow_forward_ios_outlined,
          //                   color: Colors.teal)
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
  Widget getSearchableDropdown(List<String> listData, mapKey) {
    List<DropdownMenuItem> items = [];
    for(int i=0; i < listData.length; i++) {
      items.add(new DropdownMenuItem(
          child: new Text(
            listData[i],
          ),
          value: listData[i],
        )
      );
    }
    return new SearchableDropdown(
      underline: Padding(padding: EdgeInsets.all(5)),
      items: items,
      value: selectedValueMap[mapKey],
      isCaseSensitiveSearch: false,
      hint: new Text(
        'Select Debit side Ledger'
      ),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(
            fontSize: 20
        ),
      ),
      onChanged: (value) {
        setState(() {
          selectedValueMap[mapKey] = value;
        });
      },
    );
  }

}
