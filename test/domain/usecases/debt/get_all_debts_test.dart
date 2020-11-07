import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/core/usecase/usecase.dart';
import 'package:financial_app/domain/entities/debt.dart';
import 'package:financial_app/domain/enums/debt_category_enum.dart';
import 'package:financial_app/domain/repositories/debt_repository.dart';
import 'package:financial_app/domain/usecases/debt/get_all_debts.dart';

class MockDebtRepository extends Mock
  implements DebtRepository {}

void main() {
  GetAllDebts getAllDebts;
  MockDebtRepository mockDebtRepository;
  List<Debt> tDebtList = [
    Debt(
      id: '1',
      amount: 200.0,
      debtCategory: DebtCategory.Food,
      date: DateTime(2020,01,11),
      description: 'Test',
      imageUrls: []
    ),
    Debt(
      id: '2',
      amount: 200.0,
      debtCategory: DebtCategory.Food,
      date: DateTime(2020,01,11),
      description: 'Test',
      imageUrls: []
    ),
  ];


  setUp(() {
    mockDebtRepository = MockDebtRepository();
    getAllDebts = GetAllDebts(mockDebtRepository);
  });

  test(
    'should return all Credits when they exist',
    () async {
      // arrange
      when(mockDebtRepository.getAllDebts())
        .thenAnswer((_) async => Right(tDebtList));
      // act
      final result = await getAllDebts(NoParams());
      // assert
      expect(result, Right(tDebtList));
    },
  );
}