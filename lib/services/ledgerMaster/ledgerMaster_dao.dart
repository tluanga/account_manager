import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/database/dao.service.dart';

class LedgerMasterDao implements Dao<LedgerMaster> {
  final columnId = 'id';
  final tableName = 'ledgerMaster';
  final _name = 'name';
  final _description = 'description';

  @override
  String get createTableQuery =>
      "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,"
      "$_name TEXT,"
      "$_description TEXT)";

  @override
  LedgerMaster fromMap(Map<String, dynamic> query) {
    LedgerMaster ledgerMaster = LedgerMaster();
    ledgerMaster.id = query[columnId];
    ledgerMaster.name = query[_name];
    ledgerMaster.description = query[_description];
    return ledgerMaster;
  }

  @override
  Map<String, dynamic> toMap(LedgerMaster ledgerMaster) {
    return <String, dynamic>{
      _name: ledgerMaster.name,
      _description: ledgerMaster.description
    };
  }

  @override
  List<LedgerMaster> fromList(List<Map<String, dynamic>> query) {
    List<LedgerMaster> ledgerMasterList = List<LedgerMaster>();
    for (Map map in query) {
      ledgerMasterList.add(
        fromMap(map),
      );
    }
    return ledgerMasterList;
  }
}
