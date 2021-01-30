import 'package:account_manager/business_logic/view_models/books/tradingAccount/tradingAccount.viewmodel.dart';

abstract class TradingAccountService {
  Future<List<TradingAccount>> getDirectExpense();
}
