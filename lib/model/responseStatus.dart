// To parse this JSON data, do
//
//     final responseStatus = responseStatusFromJson(jsonString);

import 'dart:convert';

class ResponseStatus {
  ResponseStatus({
    this.status,
    this.message,
    this.msg,
  });

  String status;
  String message;
  String msg;

  factory ResponseStatus.fromRawJson(String str) => ResponseStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseStatus.fromJson(Map<String, dynamic> json) => ResponseStatus(
    status: json["status"],
    message: json["message"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "msg": msg,
  };
}
