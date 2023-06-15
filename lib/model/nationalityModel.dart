// To parse this JSON data, do
//
//     final nationalityModel = nationalityModelFromJson(jsonString);

import 'dart:convert';

class NationalityModel {
  NationalityModel({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  List<National> data;

  factory NationalityModel.fromRawJson(String str) => NationalityModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NationalityModel.fromJson(Map<String, dynamic> json) => NationalityModel(
    status: json["status"],
    code: json["code"],
    data: List<National>.from(json["data"].map((x) => National.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class National {
  National({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory National.fromRawJson(String str) => National.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory National.fromJson(Map<String, dynamic> json) => National(
    id: json["Id"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
  };
}
