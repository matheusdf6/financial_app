import 'package:equatable/equatable.dart';
import "package:meta/meta.dart";

import '../enums/plan_category_enum.dart';
import 'credit.dart';

class Plan extends Equatable {
  final int id;
  final double plannedAmount;
  final double currentAmmount;
  final PlanCategory planCategory;
  final DateTime date;
  final List<Credit> entries;

  Plan({
    @required this.id, 
    @required this.plannedAmount, 
    @required this.currentAmmount, 
    @required this.planCategory, 
    @required this.date, 
    this.entries
  });

  @override
  List<Object> get props => [ id, plannedAmount, currentAmmount, planCategory, date, entries ];

  
}
