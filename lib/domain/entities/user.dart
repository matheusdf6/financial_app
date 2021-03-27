import 'package:meta/meta.dart';

class User {
  final String imageUrl;
  final String firstName;
  final String lastName;
  final String email;

  String get fullName => "$firstName $lastName";

  User({
    @required this.firstName,
    @required this.lastName,
    this.imageUrl,
    this.email
  });
}
