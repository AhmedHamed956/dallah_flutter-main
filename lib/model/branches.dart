// To parse this JSON data, do
//
//     final branchesModel = branchesModelFromJson(jsonString);

import 'dart:convert';

class BranchesModel {
  BranchesModel({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  List<Branch> data;

  factory BranchesModel.fromRawJson(String str) => BranchesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BranchesModel.fromJson(Map<String, dynamic> json) => BranchesModel(
    status: json["status"],
    code: json["code"],
    data: List<Branch>.from(json["data"].map((x) => Branch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Branch {
  Branch({
    this.id,
    this.address,
    this.title,
    this.addressAr,
    this.titleAr,
    this.phone,
    this.lat,
    this.lng,
  });

  int id;
  String address;
  String title;
  String addressAr;
  String titleAr;
  String phone;
  double lat;
  double lng;

  factory Branch.fromRawJson(String str) => Branch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    address: json["address"],
    title: json["title"],
    addressAr: json["address_ar"],
    titleAr: json["title_ar"],
    phone: json["phone"],
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "title": title,
    "address_ar": addressAr,
    "title_ar": titleAr,
    "phone": phone,
    "lat": lat,
    "lng": lng,
  };
}
