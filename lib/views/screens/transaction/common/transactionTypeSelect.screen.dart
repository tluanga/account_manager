import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';

import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/transactionType.constant.dart';
import 'package:account_manager/views/screens/transaction/common/AssetSelection.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, rAssetSelect);
                          },
                          child: Text('New Asset'),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.transactionTypeList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  model.setSelectedTransactionType(
                                      model.transactionTypeList[index]);

                                  if (model.transactionTypeList[index].id ==
                                      TransactionTypeConstant
                                          .cPURCHASEOFASSET) {
                                    print('asset selected');
                                    Navigator.pushNamed(context, rAssetSelect);
                                  }
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.black12)),
                                    child: Row(children: [
                                      Container(
                                          height: 50,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: cprimaryColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5))),
                                          child: Center(
                                              child: Text(model
                                                  .transactionTypeList[index]
                                                  .sumChetVelDanType
                                                  .toString()))),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Center(
                                        child: Text(
                                          model.transactionTypeList[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          model.transactionTypeList[index]
                                              .description,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                        ),
                                      )
                                    ]),
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
