// import 'package:accounting_app/helper/company_profile_db.dart';
// import 'package:accounting_app/models/companyProfile_model.dart';
// import 'package:accounting_app/screens/settings/companyProfile/editCompanyProfile.screen.dart';
// import 'package:accounting_app/screens/static/constants.dart';
// // import 'package:accounting_app/screens/static/route.dart';
// import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// class CompanyProfile extends StatefulWidget {
//   @override
//   CompanyProfileState createState() => CompanyProfileState();
// }

// class CompanyProfileState extends State<CompanyProfile> {
//   Future<List<Company>> _companyList;

//   @override
//   void initState() {
//     super.initState();
//     _updateCompanyList();
//   }

//   _updateCompanyList() {
//     setState(() {
//       _companyList = CompanyDatabaseHelper.instance.getCompanyList();
//     });
//   }

//   Widget _buildCompany(Company company) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: ListTile(
//               leading: Text(
//                 company.name,
//                 style: TextStyle(
//                   //  backgroundColor: Colors.black,
//                   fontSize: 18.0,
//                 ),
//               ),
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => EditCompanyProfile(
//                     updateCompanyList: _updateCompanyList,
//                     company: company,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Company Profile'),
//         backgroundColor: cappRawng,
//       ),
//       floatingActionButton: FloatingActionButton(
//       backgroundColor: cappRawng,
//       child: Icon(Icons.add),
//       onPressed: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => EditCompanyProfile(
//             updateCompanyList: _updateCompanyList,
//           ),
//         ),
//       ),
//       ),
//       body:FutureBuilder(
//         future: _companyList,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView.builder(
//             padding: EdgeInsets.symmetric(vertical: 30.0),
//             itemCount: 1 + snapshot.data.length,
//             itemBuilder: (BuildContext context, int index) {
//               if (index == 0) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${snapshot.data.length}',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 10.0,
//                           fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//               return _buildCompany(snapshot.data[index - 1]);
//             },
//           );
//         },
//       ),);
//   }
// }
