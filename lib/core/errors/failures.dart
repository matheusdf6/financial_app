import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {  
  List properties;

  Failure([ properties = const<dynamic>[] ]);

  @override
  // TODO: implement props
  List<Object> get props => [ properties ];
}