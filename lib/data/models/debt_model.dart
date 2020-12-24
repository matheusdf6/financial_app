import 'package:meta/meta.dart';

import '../../domain/entities/debt.dart';
import '../../domain/enums/debt_category_enum.dart';

class DebtModel extends Debt {

  DebtModel({
    @required DebtCategory debtCategory,
    @required String id,
    @required DateTime date,
    @required double amount,
    String description,
    List<String> imageUrls 
  }) : super(
    id: id,
    debtCategory: debtCategory,
    date: date,
    amount: amount,
    description: description,
    imageUrls: imageUrls
  );

  factory DebtModel.fromJson(Map<String, dynamic> map) {
    return DebtModel(
      id: map['id'] as String,
      date: DateTime.parse(map['date']),
      amount: map['amount'] as double,
      debtCategory: DebtCategory.values[map['debtCategory']],
      description: map['description'] as String,
      imageUrls: List<String>.from(map['imageUrls'])
    );
  }
  
  Map<String, dynamic> toJson(DebtModel debt) => {
    'id': debt.id,
    'date': debt.date.toIso8601String(),
    'amount': amount,
    'debtCategory': debtCategory.index,
    'description': description,
    'imageUrls': imageUrls,
  };
}