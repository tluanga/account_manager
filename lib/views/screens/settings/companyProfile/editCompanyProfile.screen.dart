import 'package:accounting_app/helper/company_profile_db.dart';
import 'package:accounting_app/models/companyProfile_model.dart';
import 'package:accounting_app/screens/static/constants.dart';
import 'package:flutter/material.dart';

class EditCompanyProfile extends StatefulWidget {
  final Function updateCompanyList;
  final Company company;

  EditCompanyProfile({this.updateCompanyList, this.company});

  @override
  _EditCompanyProfileState createState() => _EditCompanyProfileState();
}

class _EditCompanyProfileState extends State<EditCompanyProfile> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';
  String _city = '';
  String _state = '';
  String _country = '';
  String _email = '';
  int _phoneNumber = 0;

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
    }
  }

  _delete() {
    CompanyDatabaseHelper.instance.deleteCompany(widget.company.id);
    widget.updateCompanyList();
    Navigator.pop(context);
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // print('$_title, $_date, $_priority');

      Company company = Company(
        name: _name,
        address: _address,
        city: _city,
        state: _state,
        country: _country,
        email: _email,
        phoneNumber: _phoneNumber,
      );
      if (widget.company == null) {
        // Insert the company to our user's database
        CompanyDatabaseHelper.instance.insertCompany(company);
      } else {
        // Update the company
        company.id = widget.company.id;
        CompanyDatabaseHelper.instance.updateCompany(company);
      }
      widget.updateCompanyList();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cappRawng,
        title: Text('Edit Company Profile'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
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
                      padding: EdgeInsets.all(20),
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 60.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: cappRawng,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: FlatButton(
                            child: Text(
                              widget.company == null ? 'Add' : 'Update',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            onPressed: () {
                              _submit();
                            },
                          ))),
                  widget.company != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 60.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: FlatButton(
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              onPressed: _delete,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
