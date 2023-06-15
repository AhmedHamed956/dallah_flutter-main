// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

class RegisterModel {
  RegisterModel({
    this.fullName,
    this.idNumber,
    this.dType,
    this.birthday,
    this.nationalityId,
    this.email,
    this.mobile,
    this.password,
    this.gender,
    this.school,
    this.imgNationalId,
    this.birthdayrequired,
  });

  String fullName;
  String idNumber;
  String dType;
  String birthday;
  String nationalityId;
  String email;
  String mobile;
  String password;
  String gender;
  String school;
  String imgNationalId;
  String birthdayrequired ;

  factory RegisterModel.fromRawJson(String str) => RegisterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    fullName: json["FullName"],
    idNumber: json["IDNumber"],
    dType: json["d_type"],
    birthday: json["Birthday"],
    nationalityId: json["NationalityId"],
    email: json["email"],
    mobile: json["mobile"],
    password: json["password"],
    gender: json["gender"],
    school: json["school"],
    imgNationalId: json["img_national_id"],
    birthdayrequired: json["birthdayrequired"],
  );

  Map<String, dynamic> toJson() => {
    "FullName": fullName,
    "IDNumber": idNumber,
    "d_type": dType,
    "Birthday": birthday,
    "NationalityId": nationalityId,
    "email": email,
    "mobile": mobile,
    "password": password,
    "gender": gender,
    "school": school,
    "img_national_id": imgNationalId,
    "birthdayrequired": birthdayrequired,
  };
}
