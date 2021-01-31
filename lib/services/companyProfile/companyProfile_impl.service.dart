import 'package:account_manager/business_logic/models/companyProfile_model.dart';
import 'package:account_manager/services/companyProfile/companyProfile.service.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:sqflite/sqflite.dart';

class CompanyProfileImpl implements CompanyProfileService {
  Future<List<Map<String, dynamic>>> getCompanyMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result =
        await db.query('companyprofile_table');
    return result;
  }

  Future<List<Company>> getCompanyList() async {
    final List<Map<String, dynamic>> companyMapList = await getCompanyMapList();
    final List<Company> companyList = [];
    companyMapList.forEach((companyMap) {
      companyList.add(Company.fromMap(companyMap));
    });
    // companyList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return companyList;
  }

  Future<int> insert(Company company) async {
    Database db = await DatabaseHelper.instance.db;
    print('inserting company profile');
    final int result = await db.insert('companyprofile_table', company.toMap());
    return result;
  }

  Future<int> update(Company company) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    final int result = await db.update(
      'companyprofile_table',
      company.toMap(),
      where: 'id = ?',
      whereArgs: [company.id],
    );
    return result;
  }

  Future<int> delete(Company company) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    final int result = await db.delete(
      'companyprofile_table',
      where: 'id = ?',
      whereArgs: [company.id],
    );
    return result;
  }
}
