
class UserModel extends User {
  UserModel({
    @required String firstName,
    @required String lastName,
    String imageUrl,
    String email
  }) : super(
    firstName: firstName,
    lastName: lastName,
    imageUrl: imageUrl,
    email: email
  );

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      imageUrl: map['imageUrl'],
      email: map['email'],
    );
  }

  static Map<String, dynamic> toJson(UserModel user) => {
    'firstName': user.firstName,
    'lastName': user.lastName,
    'imageUrl': user.imageUrl,
    'email': user.email, 
  };
}