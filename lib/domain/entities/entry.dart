import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Entry extends Equatable {
  final String id;
  final DateTime date;
  final double amount;
  final String description;
  final List<String> imageUrls;

  Entry({
    @required this.id,
    @required this.date,
    @required this.amount,
    this.description,
    this.imageUrls,
  });

  @override
  List<Object> get props =>
      [id, date, amount, description, imageUrls ];
}
