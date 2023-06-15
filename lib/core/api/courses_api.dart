import 'dart:convert';
import 'package:dallah/core/config/shared_data.dart';
import 'package:dallah/model/branches.dart';
import 'package:dallah/model/courses.dart';
import 'package:dallah/model/examModel.dart';
import 'package:dallah/model/faq.dart';
import 'package:dallah/model/galleries.dart';
import 'package:dallah/model/myCourses.dart';
import 'package:dallah/model/nationalityModel.dart';
import 'package:dallah/model/news.dart';
import 'package:dallah/model/registerModel.dart';
import 'package:dallah/model/reserveModel.dart';
import 'package:dallah/model/responseApi.dart';
import 'package:dallah/model/responseStatus.dart';
import 'package:dallah/model/resultModel.dart';
import 'package:dallah/model/schoolModel.dart';
import 'package:dallah/model/timeModel.dart';
import 'package:dallah/model/videosModel.dart';
import 'package:dallah/view/index.dart';
import 'package:dallah/view/widgets/WebViewExample.dart';
import 'package:dio/dio.dart';
import 'package:dallah/core/config/handlin_error.dart';
import 'package:dallah/core/constants/strings.dart';
import 'package:intl/intl.dart';

class CoursesApi {
  CoursesApi._();

  static final CoursesApi instance = CoursesApi._();
  final HandlingError _handle = HandlingError.handle;

  // Dio
  Response response;
  Dio dio = new Dio();

  Future<Map<String, String>> getHeaderUser(token) async {
    print({
      'Authorization': 'Bearer $token',
    });
    return <String, String>{
      'Authorization': 'Bearer $token',
    };
  }

  Future<ResponseStatus> getCoursesData({context}) async {
    var _url = Strings.MAIN_API_URL + Strings.COURSES_START_NEW;
    try {
      // Dio Request
      var response = await dio.get(_url, options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "course_start_new",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'] ?? 'done')) {
        // Success
        print('response.data > ${response.data}');
        return ResponseStatus.fromJson(response.data);
      } else {
        // Failed
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }

  Future<MyCourses> getMyCoursesData({context}) async {
    var _url2 = Strings.MAIN_API_URL + Strings.MY_COURSES;
    print(_url2);
    try {
      // Dio Request
      var response = await dio.get(_url2, options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;
      // Debugging API response
      _handle.debugApi(
        methodName: "getMyCoursesData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'])) {
        // Success
        print('response.data > ${response.data}');
        return MyCourses.fromJson(response.data);
      } else {
        // Failed
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }

  Future<VideosModel> getMyVideosData({context}) async {
    var _url2 = Strings.MAIN_API_URL + Strings.VIDEOS;
    print(_url2);
    try {
      // Dio Request
      var response = await dio.get(Strings.MAIN_API_URL + Strings.VIDEOS, options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;
      // Debugging API response
      _handle.debugApi(
        methodName: "getMyVideosData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'])) {
        // Success
        print('response.data > ${response.data}');
        return VideosModel.fromJson(response.data);
      } else {
        // Failed
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }

  Future<ReserveModel> reserveCoursesData({context, courseId}) async {
    var _url = Strings.MAIN_API_URL + Strings.RESERVE_COURSE;
    try {
      // Dio Request
      var response =
          await dio.post(_url, data: {"courseid": courseId.toString()}, options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "reserveCoursesData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'] ?? 'done')) {
        // Success
        print('response.data > ${response.data}');
        return ReserveModel.fromJson(response.data);
      } else {
        // Failed
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }

  Future<dynamic> getPaymentCourse({context, orderId}) async {
    var _url = Strings.MAIN_API_URL + Strings.PAYMENT_COURSE + '/$orderId';
    print(_url);
    return Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewExample(_url)));
  }

  Future<ExamModel> getExamData({context, String lang}) async {
    var _url = Strings.MAIN_API_URL + Strings.TESTING_LANG;
    print({"lang": lang});
    try {
      // Dio Request
      var response = await dio.post(_url, data: {"lang": lang}, options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getExamData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'])) {
        // Success
        print('response.data > ${response.data}');
        return ExamModel.fromJson(response.data);
      } else {
        // Failed
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }

  Future<ResultModel> getResultData({context, Map<String, List<int>> answers}) async {
    var _url = Strings.MAIN_API_URL + Strings.TESTING;
    try {
      // Dio Request
      var response = await dio.post(_url, data: answers, options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getResultData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'] ?? 'done')) {
        // Success
        print('response.data > ${response}');
        return ResultModel.fromJson(response.data);
      } else {
        // Failed
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }

  Future<String> getDaysEvaluation({context}) async {
    var _url = Strings.MAIN_API_URL + Strings.EVALUATION_DAYS;
    try {
      // Dio Request
      var response = await dio.get(_url, options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getDaysEvaluation",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'] ?? 'done')) {
        // Success
        print('response.data > ${decoded['days']}');
        return decoded['days'];
      } else {
        // Failed
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }

  Future<TimeModel> getTimeData({context, date}) async {
    var _url = Strings.MAIN_API_URL + Strings.GET_TIME + DateFormat('dd-MM-yyyy').format(date).toString();
    print('_url > $_url');
    try {
      // Dio Request
      var response = await dio.get(_url, options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;
      // Debugging API response
      _handle.debugApi(
        methodName: "getTimeData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'] ?? 'done')) {
        // Success
        print('response.data > ${response.data}');
        return TimeModel.fromJson(response.data);
      } else {
        // Failed
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }

  Future<ResponseStatus> reserveTimeData({context, String periodId}) async {
    var _url = Strings.MAIN_API_URL + Strings.RESERVE;
    try {
      // Dio Request
      var response = await dio.post(_url, data: {'time': periodId}, options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "reserveTime",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'] ?? 'done')) {
        // Success
        print('response.data > ${response}');
        return ResponseStatus.fromJson(response.data);
      } else {
        // Failed
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }
}
