import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/models/party.model.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:account_manager/services/party/party.service.dart';
import 'package:sqflite/sqflite.dart';

class PartyImpl implements PartyService {
  LedgerMaster _selectedParty;

  Future<List<Map<String, dynamic>>> partyMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result = await db.query('party_table');
    return result;
  }

  Future<List<Party>> getList() async {
    final List<Map<String, dynamic>> ledgerMasterMapList = await partyMapList();
    final List<Party> ledgerMasterList = [];
    ledgerMasterMapList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(Party.fromMap(ledgerMasterMap));
    });
    // taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return ledgerMasterList;
  }

  Future<int> insert(Party party) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    final int result = await db.insert('party_table', party.toMap());
    return result;
  }

  Future<int> update(Party party) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.update(
      'party_table',
      party.toMap(),
      where: 'id = ?',
      whereArgs: [party.id],
    );
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.delete(
      'masterLedger_table',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  @override
  void setSelectedParty(LedgerMaster _ledgerMaster) {
    _selectedParty = _ledgerMaster;
  }
}
