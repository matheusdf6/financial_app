import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/domain/repositories/debt_repository.dart';
import 'package:financial_app/domain/usecases/debt/delete_debt.dart';

class MockDebtRepository extends Mock
  implements DebtRepository {}

void main() {
  DeleteDebt deleteDebt;
  MockDebtRepository mockDebtRepository;
  String tId = '1';


  setUp(() {
    mockDebtRepository = MockDebtRepository();
    deleteDebt = DeleteDebt(mockDebtRepository);
  });

  test(
    'should return true the Credit is created',
    () async {
      // arrange
      when(mockDebtRepository.deleteDebt(tId))
        .thenAnswer((_) async => Right(true));
      // act
      final result = await deleteDebt(DeleteDebtParams(
        id: tId
      ));
      // assert
      expect(result, Right(true));
    },
  );
}