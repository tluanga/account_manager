import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/database/databaseProvider.service.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';

import 'ledgerMaster_dao.dart';

class LedgerMasterImpl implements LedgerMasterService {
  final dao = LedgerMasterDao();

  @override
  DatabaseProvider databaseProvider;

  @override
  Future<LedgerMaster> insert(LedgerMaster ledgerMaster) async {
    final db = await databaseProvider.db();
    ledgerMaster.id = await db.insert(dao.tableName, dao.toMap(ledgerMaster));
    return ledgerMaster;
  }

  @override
  Future<LedgerMaster> update(LedgerMaster ledgerMaster) async {
    final db = await databaseProvider.db();
    await db.update(dao.tableName, dao.toMap(ledgerMaster),
        where: dao.columnId + "=?", whereArgs: [ledgerMaster.id]);
    return ledgerMaster;
  }

  @override
  Future<LedgerMaster> delete(LedgerMaster ledgerMaster) async {
    final db = await databaseProvider.db();
    await db.delete(
      dao.tableName,
      where: dao.columnId + "=",
      whereArgs: [ledgerMaster.id],
    );
    return ledgerMaster;
  }

  @override
  Future<List<LedgerMaster>> getLedgerMasterList() async {
    print('inside getLedgerMasterlist');
    final db = await databaseProvider.db();
    print(db.toString());
    List<Map> maps = await db.query(dao.tableName);
    // print(dao.fromList(maps).length.toString());
    return dao.fromList(maps);
  }
}
