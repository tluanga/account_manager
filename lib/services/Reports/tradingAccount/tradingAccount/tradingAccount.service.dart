import 'package:account_manager/business_logic/models/tradingAccount.models.dart';

abstract class TradingAccountService {
  Future<List<DirectExpense>> getDirectExpense();
}
