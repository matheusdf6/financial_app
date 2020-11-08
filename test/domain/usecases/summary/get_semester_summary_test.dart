import 'package:dartz/dartz.dart';
import 'package:financial_app/domain/entities/summary_list.dart';
import 'package:financial_app/domain/usecases/summary/get_semester_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/core/usecase/usecase.dart';
import 'package:financial_app/domain/entities/summary.dart';
import 'package:financial_app/domain/repositories/summary_repository.dart';
import 'package:financial_app/domain/usecases/summary/get_month_summary.dart';

class MockSummaryRepository extends Mock
  implements SummaryRepository {}

void main() {
  GetSemesterSummary getSemesterSummary;
  MockSummaryRepository mockSummaryRepository;
  SummaryList tSummaryList = SummaryList();
  tSummaryList.addAll([
    Summary(
      year: 2020,
      month: 11,
      ammountCredits: 2000.0,
      ammountDebts: 1000.0
    ),
    Summary(
      year: 2020,
      month: 10,
      ammountCredits: 2000.0,
      ammountDebts: 1000.0
    ),
  ]);


  setUp(() {
    mockSummaryRepository = MockSummaryRepository();
    getSemesterSummary = GetSemesterSummary(mockSummaryRepository);
  });

  setMockSummaryRepositoryReturnOk() {
      when(mockSummaryRepository.getSemesterSummary())
        .thenAnswer((_) async => Right(tSummaryList));
  }

  test(
    'should return one Summary when it exists',
    () async {
      // arrange
      setMockSummaryRepositoryReturnOk();
      // act
      final result = await getSemesterSummary(NoParams());
      // assert
      expect(result, Right(tSummaryList));
    },
  );
}