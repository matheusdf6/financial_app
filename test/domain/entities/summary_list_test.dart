import 'package:flutter_test/flutter_test.dart';

import 'package:financial_app/domain/entities/summary.dart';
import 'package:financial_app/domain/entities/summary_list.dart';

void main() {
  SummaryList tSummaryList = SummaryList();
  tSummaryList.addAll([
    Summary(
      year: 2020,
      month: 11,
      ammountCredits: 1000.0,
      ammountDebts: 500.0
    ),
    Summary(
      year: 2020,
      month: 10,
      ammountCredits: 750.50,
      ammountDebts: 250.50
    ),
  ]);
  
  test(
    'should return correct Debt Total',
    ()async {
      // act
      final debtsTotal = tSummaryList.debtsTotal;
      // assert
      expect(debtsTotal, 750.50);
    },
  );

  test(
    'should return correct Credit Total',
    ()async {
      // act
      final creditsTotal = tSummaryList.creditsTotal;
      // assert
      expect(creditsTotal, 1750.50);
    },
  );
  
  test(
    'should return correct Debt Total',
    ()async {
      // act
      final balanceTotal = tSummaryList.balanceTotal;
      // assert
      expect(balanceTotal, 1000.0);
    },
  );
}