import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  final String email;
  final String userName;
  final String fullName;
  final String phoneNumber;
  final String password;
  final String? userImage;

  UserModel(
      {required this.email,
      required this.userName,
      required this.fullName,
      required this.phoneNumber,
      required this.password,
      this.userImage});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        userName: json["userName"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        userImage: json["userImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "userName": userName,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "password": password,
        "userImage": userImage,
      };
}
