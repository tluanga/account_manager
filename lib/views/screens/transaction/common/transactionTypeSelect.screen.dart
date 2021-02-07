import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeSelect.viewmodel.dart';

import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/transactionType.constant.dart';
import 'package:account_manager/views/screens/transaction/common/AssetSelection.screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../../static/constants.dart';
import '../../../../static/ledgerId.constants.dart';
import '../../../../static/route.dart';
import '../../../../static/route.dart';
import '../../../../static/route.dart';

class TransactionTypeSelectScreen extends StatefulWidget {
  @override
  _TransactionTypeSelectScreenState createState() =>
      _TransactionTypeSelectScreenState();
}

class _TransactionTypeSelectScreenState
    extends State<TransactionTypeSelectScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionTypeSelectViewModel>(context, listen: false)
        .loadData();
    // _model.printData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: cprimaryColor,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 18,
            color: Colors.white,
          ),
          backgroundColor: cprimaryColor,
          centerTitle: true,
          title: Text(
            'Transaction Type Selection',
            style: TextStyle(color: Colors.white, letterSpacing: 0.05),
          ),
        ),
        body: Consumer<TransactionTypeSelectViewModel>(
          builder: (context, model, child) {
            return model.isLoading
                ? Center(child: CircularProgressIndicator())
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                              onChanged: (value) =>
                                  model.setFilteredData(value),
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Search Transaction Type...',
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1))),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.transactionTypeList.length,
                            itemBuilder: (BuildContext context, int index) {
                              String _sumChetVeldan = '';

                              _sumChetVeldan = model.sumChetVelDan(model
                                  .transactionTypeList[index]
                                  .sumChetVelDanType);

                              return GestureDetector(
                                onTap: () {
                                  if (model.transactionTypeList[index].id ==
                                      TransactionTypeConstant
                                          .cPURCHASEOFASSET) {
                                    model.setSelectedTransactionType(
                                        model.transactionTypeList[index]);
                                    Navigator.pushNamed(context, rAssetSelect);
                                  } else {
                                    model.setSelectedTransactionType(
                                        model.transactionTypeList[index]);
                                    Navigator.pop(context);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: HexColor(PRIMARYCOLOR),
                                          ),
                                          child: Text(_sumChetVeldan),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              model.transactionTypeList[index]
                                                  .name,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
