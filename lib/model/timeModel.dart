// To parse this JSON data, do
//
//     final timeModel = timeModelFromJson(jsonString);

import 'dart:convert';

class TimeModel {
  TimeModel({
    this.success,
    this.result,
    this.reserve,
    this.count,
  });

  bool success;
  List<Result> result;
  int reserve;
  int count;

  factory TimeModel.fromRawJson(String str) => TimeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
    success: json["success"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    reserve: json["reserve"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
    "reserve": reserve,
    "count": count,
  };
}

class Result {
  Result({
    this.id,
    this.fromH,
    this.toH,
    this.token,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String fromH;
  String toH;
  dynamic token;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    fromH: json["fromH"],
    toH: json["toH"],
    token: json["_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fromH": fromH,
    "toH": toH,
    "_token": token,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
