import 'package:account_manager/business_logic/models/accountingYear_model.dart';

abstract class AccountingYearService {
  //Future<List<LedgerMaster>> getLedgerMasterList(databaseProvider);
  Future<List<AccountingYear>> getList();
  Future<int> insert(AccountingYear party);
  Future<int> update(AccountingYear party);
  Future<int> delete(int id);
}
