import 'package:account_manager/business_logic/view_models/settings/party/partySelect.viewmodel.dart';
import 'package:account_manager/static/constants.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../../static/constants.dart';

import '../../../../static/route.dart';

class PartySelectScreen extends StatefulWidget {
  @override
  _PartySelectScreenState createState() => _PartySelectScreenState();
}

class _PartySelectScreenState extends State<PartySelectScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PartySelectViewModel>(context, listen: false).loadData();
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
            'Party  Selection',
            style: TextStyle(color: Colors.white, letterSpacing: 0.05),
          ),
        ),
        body: Consumer<PartySelectViewModel>(
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
                              onChanged: (_searchString) =>
                                  model.getFilteredData(_searchString),
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Select Party...',
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1))),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, rNewParty);
                                },
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: HexColor(PRIMARYCOLOR),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text('New Party'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.partyList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  print('---selected Party is---');

                                  model
                                      .setSelectedParty(model.partyList[index]);

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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 50,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                color: cprimaryColor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5))),
                                            child: Center(
                                                child: Text(model
                                                    .partyList[index].name
                                                    .toString()))),
                                        SizedBox(
                                          width: 2,
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
                    ),
                  );
          },
        ),
      ),
    );
  }
}
