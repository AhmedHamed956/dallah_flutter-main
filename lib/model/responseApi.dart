import 'dart:convert';

import 'package:dallah/model/user.dart';

class ResponseApi {
  ResponseApi({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  String status;
  int code;
  String message;
  User data;

  factory ResponseApi.fromRawJson(String str) => ResponseApi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}
