import 'package:meta/meta.dart';

import '../enums/debt_category_enum.dart';
import 'entry.dart';

class Debt extends Entry {
  final DebtCategory debtCategory;

  Debt({
    @required this.debtCategory,
    @required int id,
    @required DateTime date,
    @required double amount,
    String description,
    List<String> imageUrls,
  }) : super(
    id: id,
    date: date,
    amount: amount,
    description: description,
    imageUrls: imageUrls
  );
  
}