import 'package:account_manager/business_logic/view_models/ui/widget/baOrBaLoToggle.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/screens/transaction/common/partySelect.screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  final TextStyle _inActiveTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<BaOrBaloToggleViewModel>(builder: (context, model, child) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                model.setBaOrBalo(cCredit);

                baTypeModalBottomSheet(context);
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new PartySelectScreen();
                    },
                    fullscreenDialog: true));
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: model.getBaOrBalo() == cCredit
                    ? _activeBoxDecoration
                    : _inActiveBoxDecoration,
                child: Center(
                  child: Text('Ba',
                      style: model.getBaOrBalo() == cCredit
                          ? _activeTextStyle
                          : _inActiveTextStyle),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () => model.setBaOrBalo(cCashDown),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: model.getBaOrBalo() == cCashDown
                    ? _activeBoxDecoration
                    : _inActiveBoxDecoration,
                child: Center(
                  child: Text('Balo',
                      style: model.getBaOrBalo() == cCashDown
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

  void baTypeModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Consumer<BaOrBaloToggleViewModel>(
          builder: (context, baOrBalo, child) {
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
              fontSize: 18,
              fontWeight: FontWeight.w500,
            );
            final TextStyle _inActiveTextStyle = TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            );
            return Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Full Credit');
                      baOrBalo.setBaType(cFullCredit);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: baOrBalo.getBaOrBalo() == cCashDown
                          ? _activeBoxDecoration
                          : _inActiveBoxDecoration,
                      child: Center(
                        child: Text('Full Credit',
                            style: baOrBalo.getBaOrBalo() == cCashDown
                                ? _activeTextStyle
                                : _inActiveTextStyle),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Partial Credit');
                      baOrBalo.setBaType(cPartialCredit);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: baOrBalo.getBaOrBalo() == cCashDown
                          ? _activeBoxDecoration
                          : _inActiveBoxDecoration,
                      child: Center(
                        child: Text('Partial Credit',
                            style: baOrBalo.getBaOrBalo() == cCashDown
                                ? _activeTextStyle
                                : _inActiveTextStyle),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
