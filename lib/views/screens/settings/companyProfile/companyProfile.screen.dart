import 'package:account_manager/business_logic/view_models/settings/companyProfile/companyProfile.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                        'Firm Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(':'),
                      Text('Mizoram Food'),
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
                      Text('C-87, Ramhlun North'),
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
                      Text('Aizawl'),
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
                      Text('Mizoram'),
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
                      Text('India'),
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
                      Text('MizoramFoods@gmail.com'),
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
                      Text('AHEPH1111'),
                    ],
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
