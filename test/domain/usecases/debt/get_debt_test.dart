import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/domain/entities/debt.dart';
import 'package:financial_app/domain/enums/debt_category_enum.dart';
import 'package:financial_app/domain/repositories/debt_repository.dart';
import 'package:financial_app/domain/usecases/debt/get_debt.dart';

class MockDebtRepository extends Mock
  implements DebtRepository {}

void main() {
  GetDebt getDebt;
  MockDebtRepository mockDebtRepository;
  String tId = '1';
  Debt tDebt = Debt(
    id: '1',
    amount: 200.0,
    debtCategory: DebtCategory.Food,
    date: DateTime(2020,01,11),
    description: 'Test',
    imageUrls: []
  );


  setUp(() {
    mockDebtRepository = MockDebtRepository();
    getDebt = GetDebt(mockDebtRepository);
  });

  test(
    'should return one Credit when it exists',
    () async {
      // arrange
      when(mockDebtRepository.getDebt(tId))
        .thenAnswer((_) async => Right(tDebt));
      // act
      final result = await getDebt(GetDebtParams(
        id: tId
      ));
      // assert
      expect(result, Right(tDebt));
    },
  );
}