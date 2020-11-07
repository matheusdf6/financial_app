import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/core/usecase/usecase.dart';
import 'package:financial_app/domain/entities/credit.dart';
import 'package:financial_app/domain/enums/credit_category_enum.dart';
import 'package:financial_app/domain/repositories/credit_repository.dart';
import 'package:financial_app/domain/usecases/credit/get_all_credits.dart';
import 'package:financial_app/domain/usecases/credit/get_credit.dart';

class MockCreditRepository extends Mock
  implements CreditRepository {}

void main() {
  GetCredit getCredit;
  MockCreditRepository mockCreditRepository;
  String tId = '1';
  Credit tCredit = Credit(
    id: '1',
    amount: 200.0,
    creditCategory: CreditCategory.Bank,
    date: DateTime(2020,01,11),
    description: 'Test',
    imageUrls: []
  );


  setUp(() {
    mockCreditRepository = MockCreditRepository();
    getCredit = GetCredit(mockCreditRepository);
  });

  test(
    'should return one Credit when it exists',
    () async {
      // arrange
      when(mockCreditRepository.getCredit(tId))
        .thenAnswer((_) async => Right(tCredit));
      // act
      final result = await getCredit(GetCreditParams(
        id: tId
      ));
      // assert
      expect(result, Right(tCredit));
    },
  );
}