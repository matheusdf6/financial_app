import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:financial_app/domain/entities/summary.dart';
import 'package:financial_app/domain/repositories/summary_repository.dart';
import 'package:financial_app/domain/entities/summary_list.dart';
import 'package:financial_app/domain/enums/debt_category_enum.dart';
import 'package:financial_app/domain/usecases/summary/get_semester_category_summary.dart';

class MockSummaryRepository extends Mock
  implements SummaryRepository {}

void main() {
  GetCategorySemesterSummary getCategorySemesterSummary;
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
    getCategorySemesterSummary = GetCategorySemesterSummary(mockSummaryRepository);
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
      final result = await getCategorySemesterSummary(GetCategorySemesterSummaryParams(
        category: DebtCategory.Food
      ));
      // assert
      expect(result, Right(tSummaryList));
    },
  );
}