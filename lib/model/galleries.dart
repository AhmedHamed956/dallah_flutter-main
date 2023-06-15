// To parse this JSON data, do
//
//     final galleriesModel = galleriesModelFromJson(jsonString);

import 'dart:convert';

class GalleriesModel {
  GalleriesModel({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  List<Gallery> data;

  factory GalleriesModel.fromRawJson(String str) => GalleriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GalleriesModel.fromJson(Map<String, dynamic> json) => GalleriesModel(
    status: json["status"],
    code: json["code"],
    data: List<Gallery>.from(json["data"].map((x) => Gallery.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Gallery {
  Gallery({
    this.id,
    this.catname,
    this.catnameEn,
    this.catnameOrd,
    this.photos,
  });

  int id;
  String catname;
  String catnameEn;
  String catnameOrd;
  List<Photo> photos;

  factory Gallery.fromRawJson(String str) => Gallery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    id: json["id"],
    catname: json["catname"],
    catnameEn: json["catname_en"],
    catnameOrd: json["catname_ord"],
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "catname": catname,
    "catname_en": catnameEn,
    "catname_ord": catnameOrd,
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
  };
}

class Photo {
  Photo({
    this.photoId,
    this.parentId,
    this.photo,
    this.token,
    this.title,
    this.titleEn,
    this.titleOrd,
    this.type,
    this.videolink,
  });

  int photoId;
  int parentId;
  String photo;
  String token;
  String title;
  String titleEn;
  String titleOrd;
  Type type;
  String videolink;

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    photoId: json["photo_id"],
    parentId: json["parent_id"],
    photo: json["photo"],
    token: json["token"],
    title: json["title"],
    titleEn: json["title_en"],
    titleOrd: json["title_ord"],
    type: typeValues.map[json["type"]],
    videolink: json["videolink"],
  );

  Map<String, dynamic> toJson() => {
    "photo_id": photoId,
    "parent_id": parentId,
    "photo": photo,
    "token": token,
    "title": title,
    "title_en": titleEn,
    "title_ord": titleOrd,
    "type": typeValues.reverse[type],
    "videolink": videolink,
  };
}

enum Type { PHOTO }

final typeValues = EnumValues({
  "photo": Type.PHOTO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
