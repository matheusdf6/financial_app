import 'package:equatable/equatable.dart';

class Summary extends Equatable {
  final int year;
  final int month;
  final double ammountDebts;
  final double ammountCredits;
  
  double get ammountBalance => this.ammountCredits - this.ammountDebts;

  Summary({
    this.year, 
    this.month, 
    this.ammountDebts, 
    this.ammountCredits
  });

  @override
  List<Object> get props => [ year, month, ammountDebts, ammountCredits ];
}