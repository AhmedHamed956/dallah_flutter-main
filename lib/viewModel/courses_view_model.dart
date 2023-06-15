import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dallah/core/api/common_api.dart';
import 'package:dallah/core/api/courses_api.dart';
import 'package:dallah/model/courses.dart';
import 'package:dallah/model/examModel.dart';
import 'package:dallah/model/faq.dart';
import 'package:dallah/model/galleries.dart';
import 'package:dallah/model/myCourses.dart';
import 'package:dallah/model/news.dart';
import 'package:dallah/model/resultModel.dart';
import 'package:dallah/model/timeModel.dart';
import 'package:dallah/model/videosModel.dart';
import 'package:dallah/view/ui/exam/finish_exam.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../view/index.dart';

class CoursesViewModel extends BaseViewModel {
  CoursesViewModel();

  final CoursesApi _apiCommon = CoursesApi.instance;
  List<Course> list = [];
  List<Datum> listExam = [];
  List<MyCourse> listMyCourses = [];
  List<Result> listTimeDate = [];
  int index = 0;
  int correctAns = 0;
  int wrongAns = 0;
  PageController pageController = PageController();
  Map<String, List<int>> answers = {
    "q": [],
    "sw": [],
  };
  ResultModel resultModel = ResultModel();
  bool isLoadPayment = false;
  Video videosData;
  bool isEvaluation = false;
  DateTime selectedDate;
  Result selectedTimeDate;
  bool isReserveLoad = false;
  List<dynamic> listDateEval = [];

  // init ViewModel data
  initScreen(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getCoursesData(context: context);
    BotToast.showText(
      text: r.msg,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      textStyle: TextStyle(fontSize: 14, color: Colors.white),
      contentColor: Colors.grey,
      contentPadding: EdgeInsets.all(10),
    );
    setBusy(false);
  }

  // My courser
  getMyCourses(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getMyCoursesData(context: context);
    if (r.data != null) {
      listMyCourses = r.data;
    }
    setBusy(false);
  }

  // My Videos
  getMyVideos(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getMyVideosData(context: context);
    if (r.video != null) {
      videosData = r.video;
    }
    setBusy(false);
  }

  // reserve course
  reserveCourse(context, courseId) async {
    print('### Init ${this.runtimeType} ###');
    isLoadPayment = true;
    notifyListeners();
    final r = await _apiCommon.reserveCoursesData(context: context, courseId: courseId);
    if (r.id != null) {
      await _apiCommon.getPaymentCourse(context: context, orderId: r.id.toString());
      isLoadPayment = false;
      notifyListeners();
    }
    isLoadPayment = false;
    notifyListeners();
  }

  // start exam
  startExam(context, lang) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getExamData(context: context, lang: lang);
    if (r.data != null) {
      listExam = r.data;
    }
    setBusy(false);
  }

  checkAnswer(context, Datum question) {
    question.asw.forEach((element) {
      print(element.toJson());
    });
    if (question.asw.any((element) => element.check == true)) {
      final correct = question.asw.firstWhere((element) => element.correct == 1);
      final selectAns = question.asw.firstWhere((element) => element.check == true);
      final notSelectAns = question.asw.where((element) => element.check != true);
      if (correct == selectAns) {
        print('Correct answer');
        selectAns.checkCorrect = 1;
        correctAns = correctAns + 1;
        notifyListeners();
        answers['q'].add(question.id);
        answers['sw'].add(selectAns.id);
      } else {
        print('wrong answer');
        selectAns.checkCorrect = 2;
        wrongAns = wrongAns + 1;
        notSelectAns.forEach((element) {
          if (element.correct == 1) {
            element.checkCorrect = 1;
          }
        });
        answers['q'].add(question.id);
        answers['sw'].add(selectAns.id);
        notifyListeners();
      }
      if (listExam.length == (index + 1)) {
        print('answers > $answers');
        Navigator.push(context, MaterialPageRoute(builder: (context) => FinishExam(answers)));
      } else {
        Future.delayed(const Duration(milliseconds: 1000), () {
          pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeIn);
          index = index + 1;
          notifyListeners();
        });
      }
    } else {
      BotToast.showText(
        text: translate('select_ans'),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        textStyle: TextStyle(fontSize: 14, color: Colors.white),
        contentColor: Colors.grey,
        contentPadding: EdgeInsets.all(10),
      );
    }

    // listExam[index].asw.forEach((element) {
    //   if(element == answer){
    //     checkAns = true;
    //     return;
    //   }
    // });
  }

  // Get result exam
  resultExam(context, listAnswers) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getResultData(context: context, answers: listAnswers);
    if (r != null) {
      resultModel = r;
    }
    setBusy(false);
  }

  // Check evaluation
  evaluation(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getDaysEvaluation(context: context);
    if (r != null) {
      listDateEval = jsonDecode(r);
      print('listDateEval > ${listDateEval[0]}');

      // if (r.status == 'true') {
      //   isEvaluation = true;
      // } else {
      //   isEvaluation = false;
      // }
    }
    setBusy(false);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColors.primaryColor,
              accentColor: AppColors.secondaryColor,
            ),
            child: child,
          );
        },
        selectableDayPredicate: (DateTime val) {
          // print('val > $val');
          if (val == DateTime.now()) {
            return true;
          } else if (listDateEval.contains("${val.year}-${val.month.toInt()}-${val.day.toInt()}")) {
            return false;
          } else {
            return true;
          }
        },
        context: context,
        initialDate: initialDataFromEval(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 360)));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      getTime(context, selectedDate);
      notifyListeners();
    }
  }

  DateTime initialDataFromEval() {
    var val = DateTime.now();
    if (listDateEval.contains("${val.year}-${val.month.toInt()}-${val.day.toInt()}")) {
      return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
    } else {
      return DateTime.now();
    }
  }

  // Get time for test
  getTime(context, date) async {
    listTimeDate.clear();
    selectedTimeDate = Result();
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getTimeData(context: context, date: date);
    if (r != null) {
      listTimeDate = r.result;
    }
    setBusy(false);
  }

  // Reserve time
  reserveTime(context) async {
    print('### Init ${this.runtimeType} ###');
    isReserveLoad = true;
    notifyListeners();
    final r = await _apiCommon.reserveTimeData(context: context, periodId: selectedTimeDate.id.toString());
    isReserveLoad = false;
    notifyListeners();
  }
}
