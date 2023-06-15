// To parse this JSON data, do
//
//     final examModel = examModelFromJson(jsonString);

import 'dart:convert';

class ExamModel {
  ExamModel({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory ExamModel.fromRawJson(String str) => ExamModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
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
    this.photo,
    this.asw,
  });

  int id;
  String name;
  String photo;
  List<Asw> asw;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
    asw: List<Asw>.from(json["asw"].map((x) => Asw.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo,
    "asw": List<dynamic>.from(asw.map((x) => x.toJson())),
  };
}

class Asw {
  Asw({
    this.id,
    this.name,
    this.correct,
  });

  int id;
  String name;
  int correct;
  bool check = false;
  int checkCorrect=  0;

  factory Asw.fromRawJson(String str) => Asw.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Asw.fromJson(Map<String, dynamic> json) => Asw(
    id: json["id"],
    name: json["name"],
    correct: json["correct"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "correct": correct,
  };
}
