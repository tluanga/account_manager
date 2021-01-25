import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';

import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/newLedgerMaster.screen.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LedgerMasterDashboard extends StatefulWidget {
  const LedgerMasterDashboard({Key key}) : super(key: key);

  @override
  _LedgerMasterDashboardState createState() => _LedgerMasterDashboardState();
}

class _LedgerMasterDashboardState extends State<LedgerMasterDashboard> {
  final NewLedgerMasterViewModel _model =
      serviceLocator<NewLedgerMasterViewModel>();
  Future<List<LedgerMaster>> _ledgerMasterList;

  @override
  @override
  void initState() {
    super.initState();
    _updateLedgerMaster();
  }

  _updateLedgerMaster() {
    setState(() {
      _ledgerMasterList = _model.getLedgerMaster();
    });
  }

  Widget _buildLedgerMaster(LedgerMaster ledgerMaster) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              ledgerMaster.name,
            ),
            subtitle: Text(
              ledgerMaster.description,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => NewLedgerMaster(
                            updateLedgerMaster: _updateLedgerMaster,
                          )));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(
                context,
                rNewLedgerMaster,
              ),
          child: Icon(Icons.add)),
      body: FutureBuilder(
        future: _ledgerMasterList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            itemCount: 1 + snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ledger Master'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${snapshot.data.length}',
                      ),
                    ],
                  ),
                );
              }
              
            return  _buildLedgerMaster(snapshot.data[index-1]);
            },
          );
        },
      ),
    );
  }
}
