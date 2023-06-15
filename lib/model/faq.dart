// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

class FaqModel {
  FaqModel({
    this.status,
    this.code,
    this.data,
  });

  String status;
  int code;
  List<FaqData> data;

  factory FaqModel.fromRawJson(String str) => FaqModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    status: json["status"],
    code: json["code"],
    data: List<FaqData>.from(json["data"].map((x) => FaqData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FaqData {
  FaqData({
    this.id,
    this.question,
    this.answer,
    this.ordered,
    this.questionAr,
    this.answerAr,
  });

  int id;
  String question;
  String answer;
  int ordered;
  String questionAr;
  String answerAr;

  factory FaqData.fromRawJson(String str) => FaqData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FaqData.fromJson(Map<String, dynamic> json) => FaqData(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
    ordered: json["ordered"],
    questionAr: json["question_ar"],
    answerAr: json["answer_ar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "answer": answer,
    "ordered": ordered,
    "question_ar": questionAr,
    "answer_ar": answerAr,
  };
}
