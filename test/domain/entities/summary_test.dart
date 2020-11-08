import 'package:financial_app/domain/entities/summary.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should return correct calculated Balance Ammount',
    ()async {
      // arrange
      Summary tSummary = Summary(
        year: 2020,
        month: 1,
        ammountCredits: 2000.00,
        ammountDebts: 1000.0
      );
      // act
      final balance = tSummary.ammountBalance;
      // assert
      expect(balance, 1000.0);
    },
  );
}