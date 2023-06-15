// To parse this JSON data, do
//
//     final slidersModel = slidersModelFromJson(jsonString);

import 'dart:convert';

class SlidersModel {
  SlidersModel({
    this.status,
    this.code,
    this.path,
    this.data,
  });

  String status;
  int code;
  String path;
  List<Slider> data;

  factory SlidersModel.fromRawJson(String str) => SlidersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SlidersModel.fromJson(Map<String, dynamic> json) => SlidersModel(
    status: json["status"],
    code: json["code"],
    path: json["path"],
    data: List<Slider>.from(json["data"].map((x) => Slider.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "path": path,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Slider {
  Slider({
    this.id,
    this.noum,
    this.title,
    this.content,
    this.titleAr,
    this.contentAr,
    this.photo,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String noum;
  String title;
  String content;
  String titleAr;
  String contentAr;
  String photo;
  dynamic link;
  DateTime createdAt;
  DateTime updatedAt;

  factory Slider.fromRawJson(String str) => Slider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    id: json["id"],
    noum: json["noum"],
    title: json["title"],
    content: json["content"],
    titleAr: json["title_ar"],
    contentAr: json["content_ar"],
    photo: json["photo"],
    link: json["link"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "noum": noum,
    "title": title,
    "content": content,
    "title_ar": titleAr,
    "content_ar": contentAr,
    "photo": photo,
    "link": link,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
