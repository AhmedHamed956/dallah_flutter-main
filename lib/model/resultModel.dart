// To parse this JSON data, do
//
//     final resultModel = resultModelFromJson(jsonString);

import 'dart:convert';

class ResultModel {
  ResultModel({
    this.items,
    this.total,
    this.success,
    this.danger,
  });

  String items;
  String total;
  int success;
  int danger;

  factory ResultModel.fromRawJson(String str) => ResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
    items: json["items"],
    total: json["total"],
    success: json["success"],
    danger: json["danger"],
  );

  Map<String, dynamic> toJson() => {
    "items": items,
    "total": total,
    "success": success,
    "danger": danger,
  };
}
