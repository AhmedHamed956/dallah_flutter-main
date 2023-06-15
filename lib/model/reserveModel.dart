// To parse this JSON data, do
//
//     final reserveModel = reserveModelFromJson(jsonString);

import 'dart:convert';

class ReserveModel {
  ReserveModel({
    this.userid,
    this.code,
    this.message,
    this.id,
  });

  int userid;
  int code;
  String message;
  int id;

  factory ReserveModel.fromRawJson(String str) => ReserveModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReserveModel.fromJson(Map<String, dynamic> json) => ReserveModel(
    userid: json["userid"],
    code: json["code"],
    message: json["message"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "code": code,
    "message": message,
    "id": id,
  };
}
