// To parse this JSON data, do
//
//     final myCourses = myCoursesFromJson(jsonString);

import 'dart:convert';

class MyCourses {
  MyCourses({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  List<MyCourse> data;

  factory MyCourses.fromRawJson(String str) => MyCourses.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyCourses.fromJson(Map<String, dynamic> json) => MyCourses(
    status: json["status"],
    code: json["code"],
    data: List<MyCourse>.from(json["data"].map((x) => MyCourse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MyCourse {
  MyCourse({
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
    this.courseName,
    this.courseStartIn,
    this.schoolName,
  });

  int orderId;
  int studentId;
  String sponserType;
  int schoolId;
  int applicationDefId;
  String courseRefNo;
  int courseId;
  int isPaid;
  String transNo;
  DateTime transPaid;
  String orderRef;
  DateTime createdAt;
  DateTime updatedAt;
  String deletedAt;
  int typeInsert;
  dynamic updateType;
  dynamic runAt;
  dynamic code;
  dynamic assignGrade;
  dynamic courseStart;
  dynamic courseEnd;
  dynamic fullname;
  dynamic idnumber;
  dynamic nationalityId;
  dynamic dob;
  dynamic mobile;
  dynamic gender;
  dynamic type;
  String courseName;
  DateTime courseStartIn;
  String schoolName;

  factory MyCourse.fromRawJson(String str) => MyCourse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyCourse.fromJson(Map<String, dynamic> json) => MyCourse(
    orderId: json["OrderId"],
    studentId: json["StudentId"],
    sponserType: json["SponserType"],
    schoolId: json["SchoolId"],
    applicationDefId: json["ApplicationDefId"],
    courseRefNo: json["CourseRefNo"],
    courseId: json["CourseId"],
    isPaid: json["IsPaid"],
    transNo: json["trans_no"],
    transPaid: DateTime.parse(json["trans_paid"]),
    orderRef: json["order_ref"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
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
    courseName: json["CourseName"],
    courseStartIn: DateTime.parse(json["CourseStartIn"]),
    schoolName: json["schoolName"],
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
    "trans_paid": transPaid.toIso8601String(),
    "order_ref": orderRef,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
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
    "CourseName": courseName,
    "CourseStartIn": "${courseStartIn.year.toString().padLeft(4, '0')}-${courseStartIn.month.toString().padLeft(2, '0')}-${courseStartIn.day.toString().padLeft(2, '0')}",
    "schoolName": schoolName,
  };
}
