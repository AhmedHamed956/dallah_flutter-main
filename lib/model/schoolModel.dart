// To parse this JSON data, do
//
//     final schoolModel = schoolModelFromJson(jsonString);

import 'dart:convert';

class SchoolModel {
  SchoolModel({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory SchoolModel.fromRawJson(String str) => SchoolModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
    status: json["status"],
    code: json["code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.branshId,
    this.active,
  });

  int id;
  String name;
  int branshId;
  int active;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["Id"],
    name: json["Name"],
    branshId: json["bransh_id"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "bransh_id": branshId,
    "active": active,
  };
}
