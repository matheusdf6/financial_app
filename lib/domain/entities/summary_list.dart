import 'dart:collection';

import 'summary.dart';

class SummaryList extends ListBase<Summary> {
  final List<Summary> list = [];

  double get balanceTotal => list.fold(0.0, (previousValue, element) => previousValue + element.ammountBalance);
  double get creditsTotal => list.fold(0.0, (previousValue, element) => previousValue + element.ammountCredits);
  double get debtsTotal => list.fold(0.0, (previousValue, element) => previousValue + element.ammountDebts);

  /**
   * Overrides
   */
  @override
  int get length => list.length;

  @override
  void set length(int newLenght) => list.length = newLenght;

  @override
  Summary operator [](int index) => list[index];
  
  @override
  void operator []=(int index, Summary value) => list[index] = value;
}