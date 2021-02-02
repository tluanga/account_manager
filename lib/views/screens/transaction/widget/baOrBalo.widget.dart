import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modalBottomSheet.modal.dart';

class SelectBaOrBaloToggle extends StatelessWidget {
  final BuildContext context;
  SelectBaOrBaloToggle({this.context});
  final BoxDecoration _activeBoxDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.yellow.shade700,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(7),
  );
  final BoxDecoration _inActiveBoxDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.grey.shade700,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(7),
  );
  final TextStyle _activeTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  final TextStyle _inActiveTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<NewPurchaseTransactionViewModel>(
        builder: (context, model, child) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                model.setBaOrBalo(cBA);
                modalBottomSheet(context);
              },
              child: Container(
                height: 40,
                width: 165,
                decoration: model.getBaOrBalo() == cBA
                    ? _activeBoxDecoration
                    : _inActiveBoxDecoration,
                child: Center(
                  child: Text('Ba',
                      style: model.getBaOrBalo() == cBA
                          ? _activeTextStyle
                          : _inActiveTextStyle),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () => model.setBaOrBalo(cBALO),
              child: Container(
                height: 40,
                width: 165,
                decoration: model.getBaOrBalo() == cBALO
                    ? _activeBoxDecoration
                    : _inActiveBoxDecoration,
                child: Center(
                  child: Text('Balo',
                      style: model.getBaOrBalo() == cBALO
                          ? _activeTextStyle
                          : _inActiveTextStyle),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
