import 'package:account_manager/business_logic/view_models/settings/companyProfile/companyProfile.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'editCompanyProfile.screen.dart';

class CompanyProfileScreen extends StatelessWidget {
  const CompanyProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CompanyProfileViewModel>(
          builder: (context, model, child) {
            model.loadData();
            var companyProfile = model.companyData;

            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(':'),
                      Text(
                        companyProfile != null ? companyProfile.name : '',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Address:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        companyProfile != null ? companyProfile.address : '',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'City:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        companyProfile != null ? companyProfile.city : '',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'State',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        companyProfile != null ? companyProfile.state : '',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Country:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        companyProfile != null ? companyProfile.country : '',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          // companyProfile != null ? companyProfile.email : '',
                          ''),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Gsttin:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          // companyProfile != null ? companyProfile.gstTin : '',
                          ''),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditCompanyProfileScreen()),
                      );
                    },
                    child: Container(
                      width: 400,
                      height: 40,
                      decoration: BoxDecoration(
                        color: HexColor(PRIMARYCOLOR),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          companyProfile != null ? 'EDIT' : 'NEW',
                          style: TextStyle(
                            color: HexColor(TEXTCOLOR),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
