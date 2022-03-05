class UserModel {
  String? username;
  String? password;
  String? email;

  UserModel({
    this.username,
    this.password,
    this.email,
  });

  factory UserModel.fromMap( json) => UserModel(
    username: json["username"],
    password: json["password"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "username": username,
    "password": password,
    "email": email,
  };
}
