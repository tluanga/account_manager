import 'package:account_manager/services/ledgerMaster/ledgerMaster_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static final _instance = DatabaseProvider._internal();
  static DatabaseProvider get = _instance;
  bool isInitialized = false;
  Database _db;
  DatabaseProvider._internal();

  Future<Database> db() async {
    print('inside db');
    if (!isInitialized) await _init();

    return _db;
  }

  Future _init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'account_manager.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(LedgerMasterDao().createTableQuery);
      },
    );
  }
}
