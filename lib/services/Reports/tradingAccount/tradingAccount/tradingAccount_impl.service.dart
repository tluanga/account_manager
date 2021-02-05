import 'package:account_manager/services/Reports/tradingAccount/tradingAccount/tradingAccount.service.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:account_manager/static/constants.dart';
import 'package:sqflite/sqflite.dart';

class TradingAccountImpl implements TradingAccountService {
  @override
  void getDirectIncomeData({int startDate, int endDate}) async {
    print('inside trading account get data');
    // get all direct income and expenses
    // income - Buy and Outward
    // expense -Sale and Inward
    //two tables Transaction and LedgerMaster

    Database db = await DatabaseHelper.instance.db;
    //Get all Transaction in LedgerTransaction which are direct
    //SELECT a.[CUSTOMER ID], a.[NAME], SUM(b.[AMOUNT]) AS [TOTAL AMOUNT]
    // FROM RES_DATA a INNER JOIN INV_DATA b
    // ON a.[CUSTOMER ID]=b.[CUSTOMER ID]
    // GROUP BY a.[CUSTOMER ID], a.[NAME]
    List<Map<String, dynamic>> _data = await db.rawQuery('''
    Select 
    lt.ledgerId,
    lm.name,
    SUM(lt.[amount]) as[TotalAmount]
    from ledgerTranction_table lt
    INNER JOIN masterLedger_table lm    
    ON lt.[ledgerId]=lm.[ID]
    WHERE lm.directOrIndirect=$cDirectAc
    
    GROUP BY lt.[ledgerID]
    ''');

    _data.forEach((element) {
      print(element.toString());
    });
  }

  // void ledgerTransactionWithMasterData() async {
  //   Database db = await DatabaseHelper.instance.db;
  //   List<Map<String, dynamic>> _data = await db.rawQuery('''
  //   Select
  //   lt.ledgerId,
  //   SUM(lt.[amount]) as[TotalAmount],
  //   lm.[name],
  //   lm.[directOrIndirect]
  //   from ledgerTranction_table lt
  //   INNER JOIN masterLedger_table lm
  //   ON lt.[ledgerId]=lm.[ID]
  //   GROUP BY lm.[id]
  //   ''');
  //   _data.forEach((element) {
  //     print('----------Ledger Transaction Master Data---');
  //     print(element.toString());
  //   });
  // }

  void ledgerTransactionWithMasterData() async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _data = await db.rawQuery('''
   SELECT
ledgerId, name,
abs(CASE WHEN sum(amount) filter (where debitorcredit = 'debit') IS NULL THEN 0 
	ELSE sum(amount) filter (where debitorcredit = 'debit') 
	END  -
CASE WHEN sum(amount) filter (where debitorcredit = 'credit') IS NULL THEN 0 
	ELSE sum(amount) filter (where debitorcredit = 'credit') 
	END)  amount,
case WHEN
CASE WHEN sum(amount) filter (where debitorcredit = 'debit') IS NULL THEN 0 
	ELSE sum(amount) filter (where debitorcredit = 'debit') 
	END  >
CASE WHEN sum(amount) filter (where debitorcredit = 'credit') IS NULL THEN 0 
	ELSE sum(amount) filter (where debitorcredit = 'credit') 
	END 
then 'debit'
else 'credit' end debitorCredit
FROM
(
  SELECT
  distinct lt.*,lm.name
  from
  ledgerTransaction_table lt,
  masterLedger_table lm,
  transactionType_table tt
  where
  lt.ledgerId = lm.id
  and lt.transactionTypeId = tt.transactionType
  and lm.directOrIndirect = 0 --filter only direct txns
  and lm.id not in (12,13) --exclude Purchase and Sales return types
  and tt.transactionType in (0,3) --filter only Buy and Outward txns
)
group by 
ledgerId, name
    ''');
    _data.forEach((element) {
      print('----------Ledger Transaction Master Data---');
      print(element.toString());
    });
  }
}
