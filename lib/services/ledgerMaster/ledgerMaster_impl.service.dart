import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:account_manager/services/database/tables/ledgerMaster_table.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:sqflite/sqflite.dart';

class LedgerMasterImpl implements LedgerMasterService {
  Future<int> insert(LedgerMaster ledgerMaster) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    // final int result =
    //     await db.insert(LedgerMasterTable.tableName, ledgerMaster.toMap());
    return 1;
  }
}
