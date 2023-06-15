import 'dart:convert';
import 'package:dallah/model/registerModel.dart';
import 'package:dallah/model/responseApi.dart';
import 'package:dallah/model/responseStatus.dart';
import 'package:dio/dio.dart';
import 'package:dallah/core/config/handlin_error.dart';
import 'package:dallah/core/constants/strings.dart';

class ApiAuth {
  ApiAuth._();

  static final ApiAuth instance = ApiAuth._();
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

  Future<ResponseApi> signIn({context, String idNumber, String password}) async {
    var _url = Strings.MAIN_API_URL + Strings.USER + Strings.LOGIN;
    dynamic data = {"IDNumber": idNumber, "password": password};
    try {
      // Dio Request
      var response = await dio.post(_url, data: data);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "signIn",
        statusCode: response.statusCode,
        response: decoded,
        data: data,
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'])) {
        // Success
        return ResponseApi.fromJson(response.data);
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

  Future<ResponseApi> signUp({context, RegisterModel registerModel}) async {
    var _url = Strings.MAIN_API_URL + Strings.USER + Strings.SIGNUP;
    dynamic data = registerModel.toJson();
    try {
      // Dio Request
      var response = await dio.post(_url, data: data);

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "signUp",
        statusCode: response.statusCode,
        response: decoded,
        data: data,
        url: response.realUri.path,
      );
      if (_handle.isValidResponse(response.statusCode, status: decoded['status'])) {
        // Success
        return ResponseApi.fromJson(response.data);
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

  Future<ResponseStatus> updateProfile({context, RegisterModel model}) async {
    var _url = Strings.MAIN_API_URL + Strings.USER+ Strings.UPDATE_PROFILE;
    try {
      // Dio Request
      var response = await dio.post(_url,
          data: {
            'FullName': model.fullName,
            'mobile': model.mobile,
            'NationalityId': model.nationalityId,
            'newpassword': model.password,
          },
          options: Options(headers: await getHeaderUser(Strings.token)));

      // Decoding Response.
      var decoded = response.data;

      // Debugging API response
      _handle.debugApi(
        methodName: "updateProfile",
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
