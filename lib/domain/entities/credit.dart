import 'package:meta/meta.dart';

import '../enums/credit_category_enum.dart';
import 'entry.dart';

class Credit extends Entry {
  final CreditCategory creditCategory;

  Credit({
    @required this.creditCategory,
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