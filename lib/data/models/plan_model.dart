import 'package:financial_app/data/models/credit_model.dart';
import 'package:financial_app/domain/entities/plan.dart';
import 'package:financial_app/domain/enums/plan_category_enum.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/credit.dart';
import '../../domain/enums/credit_category_enum.dart';

class PlanModel extends Plan {

  PlanModel({
    @required String id,
    @required double plannedAmount,
    @required double currentAmmount,
    @required PlanCategory planCategory,
    @required DateTime date,
    @required List<Credit> entries
  }) : super(
    id: id,
    plannedAmount: plannedAmount,
    currentAmmount: currentAmmount,
    planCategory: planCategory, 
    date: date,
    entries: entries
  );

  factory PlanModel.fromJson(Map<String, dynamic> map) {
    return PlanModel(
      id: map['id'] as String,
      plannedAmount: map['plannedAmount'] as double,
      currentAmmount: map['currentAmmount'] as double,
      planCategory: PlanCategory.values[map['planCategory']], 
      date: DateTime.parse(map['date']),
      entries: List.from(map['entries']).map<Credit>((credit) => CreditModel.fromJson(credit))
    );
  }
  
  Map<String, dynamic> toJson(PlanModel plan) => {
    'id': plan.id,
    'plannedAmount': plan.plannedAmount,
    'currentAmmount': plan.currentAmmount,
    'planCategory': planCategory.index, 
    'date': plan.date.toIso8601String(),
    'entries': entries.map<String>((entry) => entry.id)
  };
}