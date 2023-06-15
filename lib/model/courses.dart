// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

class Courses {
  Courses({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  List<Course> data;

  factory Courses.fromRawJson(String str) => Courses.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    status: json["status"],
    code: json["code"],
    data: List<Course>.from(json["data"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    this.id,
    this.courseRefNo,
    this.courseName,
    this.courseStartIn,
    this.courseEndIn,
    this.category,
    this.applicationdef,
    this.gearShiftLever,
    this.car,
    this.period,
    this.days,
    this.price,
    this.tax,
    this.schoolId,
    this.seats,
    this.enable,
    this.gender,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
    this.fromH,
    this.toH,
    this.schoolName,
  });

  int id;
  String courseRefNo;
  String courseName;
  DateTime courseStartIn;
  DateTime courseEndIn;
  int category;
  int applicationdef;
  String gearShiftLever;
  int car;
  int period;
  int days;
  int price;
  int tax;
  int schoolId;
  int seats;
  int enable;
  String gender;
  int type;
  DateTime createdAt;
  DateTime updatedAt;
  String categoryName;
  String fromH;
  String toH;
  String schoolName;

  factory Course.fromRawJson(String str) => Course.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    courseRefNo: json["CourseRefNo"],
    courseName: json["CourseName"],
    courseStartIn: DateTime.parse(json["CourseStartIn"]),
    courseEndIn: DateTime.parse(json["CourseEndIn"]),
    category: json["category"],
    applicationdef: json["applicationdef"],
    gearShiftLever: json["gearShiftLever"],
    car: json["car"],
    period: json["Period"],
    days: json["days"],
    price: json["price"],
    tax: json["tax"],
    schoolId: json["SchoolId"],
    seats: json["seats"],
    enable: json["enable"],
    gender: json["gender"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryName: json["categoryName"],
    fromH: json["fromH"],
    toH: json["toH"],
    schoolName: json["SchoolName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "CourseRefNo": courseRefNo,
    "CourseName": courseName,
    "CourseStartIn": "${courseStartIn.year.toString().padLeft(4, '0')}-${courseStartIn.month.toString().padLeft(2, '0')}-${courseStartIn.day.toString().padLeft(2, '0')}",
    "CourseEndIn": "${courseEndIn.year.toString().padLeft(4, '0')}-${courseEndIn.month.toString().padLeft(2, '0')}-${courseEndIn.day.toString().padLeft(2, '0')}",
    "category": category,
    "applicationdef": applicationdef,
    "gearShiftLever": gearShiftLever,
    "car": car,
    "Period": period,
    "days": days,
    "price": price,
    "tax": tax,
    "SchoolId": schoolId,
    "seats": seats,
    "enable": enable,
    "gender": gender,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "categoryName": categoryName,
    "fromH": fromH,
    "toH": toH,
    "SchoolName": schoolName,
  };
}
