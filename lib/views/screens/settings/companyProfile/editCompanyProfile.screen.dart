import 'package:account_manager/business_logic/models/companyProfile_model.dart';

import 'package:account_manager/business_logic/view_models/settings/companyProfile/editCompanyProfile.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EditCompanyProfileScreen extends StatefulWidget {
  final Function updateCompanyList;
  final Company company;
  const EditCompanyProfileScreen(
      {Key key, this.company, this.updateCompanyList})
      : super(key: key);

  @override
  _CompanyProfileScreenState createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<EditCompanyProfileScreen> {
  EditCompanyProfileViewModel _companyProfileViewModel =
      serviceLocator<EditCompanyProfileViewModel>();
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';
  String _city = '';
  String _state = '';
  String _country = '';
  String _email = '';
  int _phoneNumber = 0;
  String _gstTin = '';

  @override
  void initState() {
    super.initState();

    if (widget.company != null) {
      _name = widget.company.name;
      _address = widget.company.address;
      _city = widget.company.city;
      _state = widget.company.state;
      _country = widget.company.country;
      _email = widget.company.email;
      _phoneNumber = widget.company.phoneNumber;
      _gstTin = widget.company.gstTin;
    }
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      var result = _companyProfileViewModel.newCompanyProfile(
        Company(
            name: _name,
            address: _address,
            city: _city,
            country: _country,
            state: _state,
            email: _email,
            phoneNumber: _phoneNumber,
            gstTin: _gstTin),
      );
      print(result.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Company Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 5,
                    right: 5,
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (input) => input.trim().isEmpty
                        ? 'Please enter Company Name'
                        : null,
                    onSaved: (input) => _name = input,
                    initialValue: _name,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 5,
                    right: 5,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _address = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 5,
                    right: 5,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _city = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 5,
                    right: 5,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'State',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _state = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 5,
                    right: 5,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _country = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 5,
                    right: 5,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 5,
                    right: 5,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'GST Tin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _gstTin = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 5,
                    right: 5,
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _phoneNumber = int.parse(value);
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor(PRIMARYCOLOR),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: FlatButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: HexColor(TEXTCOLOR),
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        _submit();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor(PRIMARYCOLOR),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: FlatButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: HexColor(TEXTCOLOR),
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
