import 'package:meta/meta.dart';

import '../../domain/entities/credit.dart';
import '../../domain/enums/credit_category_enum.dart';

class CreditModel extends Credit {

  CreditModel({
    @required CreditCategory creditCategory,
    @required int id,
    @required DateTime date,
    @required double amount,
    String description,
    List<String> imageUrls 
  }) : super(
    id: id,
    creditCategory: creditCategory,
    date: date,
    amount: amount,
    description: description,
    imageUrls: imageUrls
  );

  factory CreditModel.fromJson(Map<String, dynamic> map) {
    return CreditModel(
      id: map['id'] as int,
      date: DateTime.parse(map['date']),
      amount: map['amount'] as double,
      creditCategory: CreditCategory.values[map['creditCategory']],
      description: map['description'] as String,
      imageUrls: List<String>.from(map['imageUrls'])
    );
  }
  
  static Map<String, dynamic> toJson(CreditModel credit) => {
    'id': credit.id,
    'date': credit.date.toIso8601String(),
    'amount': credit.amount,
    'creditCategory': credit.creditCategory.index,
    'description': credit.description,
    'imageUrls': credit.imageUrls,
  };
}