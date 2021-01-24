import 'package:account_manager/business_logic/models/companyProfile_model.dart';

abstract class CompanyProfileService {

  Future<List<Company>> getCompanyList();

  Future<int> insert(Company company);
  Future<int> update(Company company);
  Future<int> delete(Company company);
  // Future<LedgerMaster> update(LedgerMaster ledgerMaster);
  // Future<LedgerMaster> delete(LedgerMaster ledgerMaster);
}