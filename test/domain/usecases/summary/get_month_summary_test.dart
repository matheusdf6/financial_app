import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/core/usecase/usecase.dart';
import 'package:financial_app/domain/entities/summary.dart';
import 'package:financial_app/domain/repositories/summary_repository.dart';
import 'package:financial_app/domain/usecases/summary/get_month_summary.dart';

class MockSummaryRepository extends Mock
  implements SummaryRepository {}

void main() {
  GetMonthSummary getMonthSummary;
  MockSummaryRepository mockSummaryRepository;
  Summary tSummary = Summary(
    year: 2020,
    month: 11,
    ammountCredits: 2000.0,
    ammountDebts: 1000.0
  );


  setUp(() {
    mockSummaryRepository = MockSummaryRepository();
    getMonthSummary = GetMonthSummary(mockSummaryRepository);
  });

  setMockSummaryRepositoryReturnOk() {
      when(mockSummaryRepository.getMonthSummary())
        .thenAnswer((_) async => Right(tSummary));
  }

  test(
    'should return one Summary when it exists',
    () async {
      // arrange
      setMockSummaryRepositoryReturnOk();
      // act
      final result = await getMonthSummary(NoParams());
      // assert
      expect(result, Right(tSummary));
    },
  );
}