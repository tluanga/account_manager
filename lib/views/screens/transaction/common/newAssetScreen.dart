import 'package:account_manager/business_logic/view_models/settings/assetAccount/newAsset.screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../../static/constants.dart';

class NewAssetScreen extends StatelessWidget {
  const NewAssetScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Asset'),
      ),
      body: Consumer<NewAssetViewModel>(
        builder: (context, model, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    model.setName(value);
                  },
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  onChanged: (value) => model.setDescription(value),
                  decoration: InputDecoration(labelText: 'Decription'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: HexColor(TEXTCOLOR),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.pop(context);
                        },
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
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: HexColor(TEXTCOLOR),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print('new Asset Ledger');
                          model.newAssetLedger();

                          Navigator.pop(context);
                        },
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
