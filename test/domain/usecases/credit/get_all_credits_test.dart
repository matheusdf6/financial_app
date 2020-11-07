import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/core/usecase/usecase.dart';
import 'package:financial_app/domain/entities/credit.dart';
import 'package:financial_app/domain/enums/credit_category_enum.dart';
import 'package:financial_app/domain/repositories/credit_repository.dart';
import 'package:financial_app/domain/usecases/credit/get_all_credits.dart';

class MockCreditRepository extends Mock
  implements CreditRepository {}

void main() {
  GetAllCredits getAllCredits;
  MockCreditRepository mockCreditRepository;
  List<Credit> tCreditList = [
    Credit(
      id: '1',
      amount: 200.0,
      creditCategory: CreditCategory.Bank,
      date: DateTime(2020,01,11),
      description: 'Test',
      imageUrls: []
    ),
    Credit(
      id: '2',
      amount: 200.0,
      creditCategory: CreditCategory.Bank,
      date: DateTime(2020,01,11),
      description: 'Test',
      imageUrls: []
    ),
  ];


  setUp(() {
    mockCreditRepository = MockCreditRepository();
    getAllCredits = GetAllCredits(mockCreditRepository);
  });

  test(
    'should return all Credits when they exist',
    () async {
      // arrange
      when(mockCreditRepository.getAllCredits())
        .thenAnswer((_) async => Right(tCreditList));
      // act
      final result = await getAllCredits(NoParams());
      // assert
      expect(result, Right(tCreditList));
    },
  );
}