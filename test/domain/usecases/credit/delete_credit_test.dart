import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/domain/repositories/credit_repository.dart';
import 'package:financial_app/domain/usecases/credit/delete_credit.dart';

class MockCreditRepository extends Mock
  implements CreditRepository {}

void main() {
  DeleteCredit deleteCredit;
  MockCreditRepository mockCreditRepository;
  int tId = 1;


  setUp(() {
    mockCreditRepository = MockCreditRepository();
    deleteCredit = DeleteCredit(mockCreditRepository);
  });

  test(
    'should return true the Credit is created',
    () async {
      // arrange
      when(mockCreditRepository.deleteCredit(tId))
        .thenAnswer((_) async => Right(true));
      // act
      final result = await deleteCredit(DeleteCreditParams(
        id: tId
      ));
      // assert
      expect(result, Right(true));
    },
  );
}