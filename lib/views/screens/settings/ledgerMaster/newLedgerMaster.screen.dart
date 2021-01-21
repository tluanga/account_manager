import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/views/widgets/my_text_box.dart';
import 'package:flutter/material.dart';

class NewLedgerMaster extends StatelessWidget {
  final NewLedgerMasterViewModel _model =
      serviceLocator<NewLedgerMasterViewModel>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Add Ledger Master'),
            backgroundColor: Colors.grey.shade300,
          ),
          body: Column(
            children: [
              MyTextBox(
                title: 'Name',
              ),
              MyTextBox(
                title: 'Description',
              ),
              GestureDetector(
                onTap: () {
                  _model.newLedgerMaster(
                    LedgerMaster(id: 3, name: 'Discount Account'),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    border: Border.all(
                      color: Colors.green.shade600,
                    ),
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
            ],
          )),
    );
  }
}
