// To parse this JSON data, do
//
//     final pagesModel = pagesModelFromJson(jsonString);

import 'dart:convert';

class PagesModel {
  PagesModel({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  Data data;

  factory PagesModel.fromRawJson(String str) => PagesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PagesModel.fromJson(Map<String, dynamic> json) => PagesModel(
    status: json["status"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.titla,
    this.content,
  });

  int id;
  String titla;
  String content;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    titla: json["titla"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titla": titla,
    "content": content,
  };
}
