import 'package:equatable/equatable.dart';

import '../enums/plan_category_enum.dart';
import 'entry.dart';

class Plan extends Equatable {
  final String id;
  final double plannedAmount;
  final double currentAmmount;
  final PlanCategory planCategory;
  final DateTime date;
  final List<Entry> entries;

  Plan({
    this.id, 
    this.plannedAmount, 
    this.currentAmmount, 
    this.planCategory, 
    this.date, 
    this.entries
  });

  @override
  List<Object> get props => [ id, plannedAmount, currentAmmount, planCategory, date, entries ];

  
}
