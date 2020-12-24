import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/domain/entities/debt.dart';
import 'package:financial_app/domain/enums/debt_category_enum.dart';
import 'package:financial_app/domain/repositories/debt_repository.dart';
import 'package:financial_app/domain/usecases/debt/create_debt.dart';

class MockDebtRepository extends Mock
  implements DebtRepository {}

void main() {
  CreateDebt createDebt;
  MockDebtRepository mockDebtRepository;
  Debt tDebt = Debt(
    id: 1,
    amount: 200.0,
    debtCategory: DebtCategory.Food,
    date: DateTime(2020,01,11),
    description: 'Test',
    imageUrls: []
  );


  setUp(() {
    mockDebtRepository = MockDebtRepository();
    createDebt = CreateDebt(mockDebtRepository);
  });

  test(
    'should return true the Credit is created',
    () async {
      // arrange
      when(mockDebtRepository.createDebt(tDebt))
        .thenAnswer((_) async => Right(true));
      // act
      final result = await createDebt(CreateDebtParams(
        debt: tDebt
      ));
      // assert
      expect(result, Right(true));
    },
  );
}