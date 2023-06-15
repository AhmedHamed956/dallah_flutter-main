import 'dart:convert';
import 'package:dallah/core/config/shared_data.dart';
import 'package:dallah/model/branches.dart';
import 'package:dallah/model/faq.dart';
import 'package:dallah/model/galleries.dart';
import 'package:dallah/model/nationalityModel.dart';
import 'package:dallah/model/news.dart';
import 'package:dallah/model/pages.dart';
import 'package:dallah/model/registerModel.dart';
import 'package:dallah/model/responseApi.dart';
import 'package:dallah/model/responseStatus.dart';
import 'package:dallah/model/schoolModel.dart';
import 'package:dallah/model/sliders.dart';
import 'package:dallah/view/index.dart';
import 'package:dio/dio.dart';
import 'package:dallah/core/config/handlin_error.dart';
import 'package:dallah/core/constants/strings.dart';

class CommonApi {
  CommonApi._();

  static final CommonApi instance = CommonApi._();
  final HandlingError _handle = HandlingError.handle;

  // Dio
  Response response;
  Dio dio = new Dio();

  Future<Map<String, String>> getLanguage(context) async {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    var lang = localizationDelegate.currentLocale.languageCode;
    return <String, String>{
      'accept-language': lang,
    };
  }

  Future<SchoolModel> getSchoolData({context}) async {
    var _url = Strings.MAIN_API_URL + Strings.SCHOOLS;
    try {
      // Dio Request
      var response = await dio.get(_url);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getSchoolData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        print('response.data > ${response.data}');
        return SchoolModel.fromJson(response.data);
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

  Future<NationalityModel> getNationalData({context}) async {
    var _url = Strings.MAIN_API_URL + Strings.NATIONALITY;
    try {
      // Dio Request
      var response = await dio.get(_url);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getNationalData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        print('response.data > ${response.data}');
        return NationalityModel.fromJson(response.data);
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

  Future<FaqModel> getFaqData(context) async {
    var _url = Strings.MAIN_API_URL + Strings.FAQ;
    try {
      // Dio Request
      var response = await dio.get(_url);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getFaqData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        return FaqModel.fromJson(response.data);
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

  Future<NewsModel> getNewsData(context) async {
    var _url = Strings.MAIN_API_URL + Strings.NEWS;
    try {
      // Dio Request
      var response = await dio.get(_url);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getNewsData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        return NewsModel.fromJson(response.data);
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

  Future<BranchesModel> getBranchesData(context) async {
    var _url = Strings.MAIN_API_URL + Strings.BRANCHES;
    try {
      // Dio Request
      var response = await dio.get(_url);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getBranchesData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        return BranchesModel.fromJson(response.data);
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

  Future<GalleriesModel> getGalleriesData(context) async {
    var _url = Strings.MAIN_API_URL + Strings.GALLERY;
    try {
      // Dio Request
      var response = await dio.get(_url);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getGalleriesData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        return GalleriesModel.fromJson(response.data);
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

  Future<SlidersModel> getSlidersData(context) async {
    var _url = Strings.MAIN_API_URL + Strings.SLIDER;
    try {
      // Dio Request
      var response = await dio.get(_url);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getSlidersData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        return SlidersModel.fromJson(response.data);
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

  Future<PagesModel> getAboutUsData(context) async {
    var _url = Strings.MAIN_API_URL + Strings.ABOUT_US;
    try {
      // Dio Request
      var response = await dio.get(_url,
          options: Options(headers: await getLanguage(context)));

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getAboutUsData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        return PagesModel.fromJson(response.data);
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

  Future<PagesModel> getServiceData(context) async {
    var _url = Strings.MAIN_API_URL + Strings.SERVICE;
    try {
      // Dio Request
      var response = await dio.get(_url,
          options: Options(headers: await getLanguage(context)));

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "getServiceData",
        statusCode: response.statusCode,
        response: decoded,
        data: '',
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        return PagesModel.fromJson(response.data);
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

  Future<ResponseStatus> contactUs(context, name, email, phone, message) async {
    var _url = Strings.MAIN_API_URL + Strings.CONTACT;
    dynamic data = {
      "name": name,
      "msg": message,
      "email": email,
      "phone": phone
    };
    try {
      // Dio Request
      var response = await dio.post(_url, data: data);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "contactUs",
        statusCode: response.statusCode,
        response: decoded,
        data: data,
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode,
          status: decoded['status'])) {
        // Success
        return ResponseStatus.fromJson(response.data);
      } else {
        // Failed
        print('decoded > $decoded');
        _handle.showError(context: context, error: decoded['message']);
        return null;
      }
    } on DioError catch (error) {
      _handle.showError(context: context, error: 'CATCH', dioError: error);
      return null;
    }
  }
}
