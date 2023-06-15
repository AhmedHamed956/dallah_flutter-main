// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

class NewsModel {
  NewsModel({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  List<New> data;

  factory NewsModel.fromRawJson(String str) => NewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"],
    code: json["code"],
    data: List<New>.from(json["data"].map((x) => New.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class New {
  New({
    this.pageId,
    this.title,
    this.content,
    this.seoTitle,
    this.seoDesc,
    this.titleAr,
    this.contentAr,
    this.seoTitleAr,
    this.seoDescAr,
    this.photo,
    this.photo2,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  int pageId;
  String title;
  String content;
  String seoTitle;
  String seoDesc;
  String titleAr;
  String contentAr;
  String seoTitleAr;
  String seoDescAr;
  String photo;
  String photo2;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory New.fromRawJson(String str) => New.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory New.fromJson(Map<String, dynamic> json) => New(
    pageId: json["pageId"],
    title: json["title"],
    content: json["content"],
    seoTitle: json["seo_title"],
    seoDesc: json["seo_desc"],
    titleAr: json["title_ar"],
    contentAr: json["content_ar"],
    seoTitleAr: json["seo_title_ar"],
    seoDescAr: json["seo_desc_ar"],
    photo: json["photo"],
    photo2: json["photo2"],
    type: json["type_"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "pageId": pageId,
    "title": title,
    "content": content,
    "seo_title": seoTitle,
    "seo_desc": seoDesc,
    "title_ar": titleAr,
    "content_ar": contentAr,
    "seo_title_ar": seoTitleAr,
    "seo_desc_ar": seoDescAr,
    "photo": photo,
    "photo2": photo2,
    "type_": type,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    "updated_at": updatedAt.toIso8601String(),
  };
}
