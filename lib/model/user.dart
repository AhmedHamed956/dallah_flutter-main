import 'dart:convert';

class User {
  User({
    this.studentId,
    this.fullName,
    this.email,
    this.mobile,
    this.idNumber,
    this.doB,
    this.nationalityId,
    this.gender,
    this.apiToken,
  });

  int studentId;
  String fullName;
  String email;
  String mobile;
  String idNumber;
  DateTime doB;
  String nationalityId;
  String gender;
  String apiToken;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    studentId: json["StudentId"],
    fullName: json["FullName"],
    email: json["email"],
    mobile: json["mobile"],
    idNumber: json["IDNumber"],
    doB: DateTime.parse(json["DoB"]),
    nationalityId: json["NationalityId"].toString(),
    gender: json["gender"],
    apiToken: json["api_token"],
  );

  Map<String, dynamic> toJson() => {
    "StudentId": studentId,
    "FullName": fullName,
    "email": email,
    "mobile": mobile,
    "IDNumber": idNumber,
    "DoB": "${doB.year.toString().padLeft(4, '0')}-${doB.month.toString().padLeft(2, '0')}-${doB.day.toString().padLeft(2, '0')}",
    "NationalityId": nationalityId,
    "gender": gender,
    "api_token": apiToken,
  };
}
