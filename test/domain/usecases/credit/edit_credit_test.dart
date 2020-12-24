import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/domain/entities/credit.dart';
import 'package:financial_app/domain/enums/credit_category_enum.dart';
import 'package:financial_app/domain/repositories/credit_repository.dart';
import 'package:financial_app/domain/usecases/credit/edit_credit.dart';

class MockCreditRepository extends Mock
  implements CreditRepository {}

void main() {
  EditCredit editCredit;
  MockCreditRepository mockCreditRepository;
  Credit tCredit = Credit(
    id: 1,
    amount: 200.0,
    creditCategory: CreditCategory.Bank,
    date: DateTime(2020,01,11),
    description: 'Test',
    imageUrls: []
  );


  setUp(() {
    mockCreditRepository = MockCreditRepository();
    editCredit = EditCredit(mockCreditRepository);
  });

  test(
    'should return true the Credit is created',
    () async {
      // arrange
      when(mockCreditRepository.editCredit(tCredit))
        .thenAnswer((_) async => Right(true));
      // act
      final result = await editCredit(EditCreditParams(
        credit: tCredit
      ));
      // assert
      expect(result, Right(true));
    },
  );
}