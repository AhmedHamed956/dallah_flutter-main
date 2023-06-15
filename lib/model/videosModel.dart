// To parse this JSON data, do
//
//     final videosModel = videosModelFromJson(jsonString);

import 'dart:convert';

class VideosModel {
  VideosModel({
    this.status,
    this.code,
    this.st,
    this.video,
  });

  String status;
  int code;
  int st;
  Video video;

  factory VideosModel.fromRawJson(String str) => VideosModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideosModel.fromJson(Map<String, dynamic> json) => VideosModel(
    status: json["status"],
    code: json["code"],
    st: json["st"],
    video: Video.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "st": st,
    "data": video.toJson(),
  };
}

class Video {
  Video({
    this.path,
    this.orders,
  });

  String path;
  List<Order> orders;

  factory Video.fromRawJson(String str) => Video.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    path: json["path"],
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    this.orderId,
    this.studentId,
    this.sponserType,
    this.schoolId,
    this.applicationDefId,
    this.courseRefNo,
    this.courseId,
    this.isPaid,
    this.transNo,
    this.transPaid,
    this.orderRef,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.typeInsert,
    this.updateType,
    this.runAt,
    this.code,
    this.assignGrade,
    this.courseStart,
    this.courseEnd,
    this.fullname,
    this.idnumber,
    this.nationalityId,
    this.dob,
    this.mobile,
    this.gender,
    this.type,
    this.id,
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
    this.seats,
    this.enable,
    this.coId,
    this.name,
    this.token,
    this.orderCourseId,
    this.linkVideo,
  });

  int orderId;
  int studentId;
  String sponserType;
  int schoolId;
  int applicationDefId;
  String courseRefNo;
  int courseId;
  dynamic isPaid;
  dynamic transNo;
  dynamic transPaid;
  String orderRef;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  int typeInsert;
  dynamic updateType;
  dynamic runAt;
  String code;
  dynamic assignGrade;
  dynamic courseStart;
  dynamic courseEnd;
  dynamic fullname;
  dynamic idnumber;
  dynamic nationalityId;
  dynamic dob;
  dynamic mobile;
  String gender;
  int type;
  int id;
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
  int seats;
  int enable;
  int coId;
  String name;
  dynamic token;
  int orderCourseId;
  String linkVideo;

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["OrderId"],
    studentId: json["StudentId"],
    sponserType: json["SponserType"],
    schoolId: json["SchoolId"],
    applicationDefId: json["ApplicationDefId"],
    courseRefNo: json["CourseRefNo"],
    courseId: json["CourseId"],
    isPaid: json["IsPaid"],
    transNo: json["trans_no"],
    transPaid: json["trans_paid"],
    orderRef: json["order_ref"] == null ? null : json["order_ref"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    typeInsert: json["type_insert"],
    updateType: json["update_type"],
    runAt: json["run_at"],
    code: json["code"],
    assignGrade: json["assign_grade"],
    courseStart: json["course_start"],
    courseEnd: json["course_end"],
    fullname: json["fullname"],
    idnumber: json["idnumber"],
    nationalityId: json["nationality_id"],
    dob: json["dob"],
    mobile: json["mobile"],
    gender: json["gender"],
    type: json["type"],
    id: json["id"],
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
    seats: json["seats"],
    enable: json["enable"],
    coId: json["co_id"],
    name: json["name"],
    token: json["_token"],
    orderCourseId: json["course_id"],
    linkVideo: json["link_video"],
  );

  Map<String, dynamic> toJson() => {
    "OrderId": orderId,
    "StudentId": studentId,
    "SponserType": sponserType,
    "SchoolId": schoolId,
    "ApplicationDefId": applicationDefId,
    "CourseRefNo": courseRefNo,
    "CourseId": courseId,
    "IsPaid": isPaid,
    "trans_no": transNo,
    "trans_paid": transPaid,
    "order_ref": orderRef == null ? null : orderRef,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
    "type_insert": typeInsert,
    "update_type": updateType,
    "run_at": runAt,
    "code": code,
    "assign_grade": assignGrade,
    "course_start": courseStart,
    "course_end": courseEnd,
    "fullname": fullname,
    "idnumber": idnumber,
    "nationality_id": nationalityId,
    "dob": dob,
    "mobile": mobile,
    "gender": gender,
    "type": type,
    "id": id,
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
    "seats": seats,
    "enable": enable,
    "co_id": coId,
    "name": name,
    "_token": token,
    "course_id": orderCourseId,
    "link_video": linkVideo,
  };
}
