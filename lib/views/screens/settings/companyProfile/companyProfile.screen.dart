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
          builder: (context,model,child){
            return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Firm Name'),
                  Text(':'),
                  Text(model.companyData.name),
                ],
              ),
              Row(
                children: [
                  Text('Address:'),
                  Text('Mizoram Foods'),
                ],
              ),
              Row(
                children: [
                  Text('City:'),
                  Text('Mizoram Foods'),
                ],
              ),
              Row(
                children: [
                  Text('State'),
                  Text('Mizoram Foods'),
                ],
              ),
              Row(
                children: [
                  Text('Country:'),
                  Text('Mizoram Foods'),
                ],
              ),
              Row(
                children: [
                  Text('Email:'),
                  Text('Mizoram Foods'),
                ],
              ),
              Row(
                children: [
                  Text('Gsttin:'),
                  Text('Mizoram Foods'),
                ],
              )
            ],
          ),
          },
          
        ),
      ),
    );
  }
}
