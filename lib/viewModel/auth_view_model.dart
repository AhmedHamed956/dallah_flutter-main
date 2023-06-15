import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dallah/core/api/auth_api.dart';
import 'package:dallah/core/api/common_api.dart';
import 'package:dallah/core/config/handlin_error.dart';
import 'package:dallah/core/constants/strings.dart';
import 'package:dallah/model/nationalityModel.dart';
import 'package:dallah/model/registerModel.dart';
import 'package:dallah/model/schoolModel.dart';
import 'package:dallah/model/user.dart';
import 'package:dallah/view/index.dart';
import 'package:dallah/view/ui/home/home_page.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel() {
    this.autoLogin();
    this.firstTime();
  }

  final ApiAuth _api = ApiAuth.instance;
  final CommonApi _apiCommon = CommonApi.instance;
  bool firstCheck;

  // User model
  User currentUser;
  DateTime currentBackPressTime;
  final HandlingError handle = HandlingError.handle;
  final Loading _loading = Loading();
  bool _autoValidate = false;

  bool get autoValidate => _autoValidate;
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  bool get _canSubmitLogin => form.currentState.validate();

  void get _saveSubmitLogin => form.currentState.save();

  RegisterModel register = RegisterModel();
  String idNumber;
  String password;
  List<Datum> schools = [];
  List<National> nationalities = [];
  List<String> gender = ['male', 'female'];

  TextEditingController controllerBirthDay = TextEditingController();

  RegisterModel editProfile = RegisterModel();

  // Auto login
  Future<bool> autoLogin() async {
    print('autoLogin');
    if (currentUser != null) return true;
    try {
      currentUser = await getFromCache();
      return true;
    } on SocketException catch (_) {
      currentUser = await getFromCache();
      return false;
    } catch (e) {
      // print('E => $e');
      // await logout(null);
      currentUser = null;
      return false;
    } finally {}
  }

  // check first time or no
  Future<bool> firstTime() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if (_pref.getBool('firstCheck') == null) {
      _pref.setBool("firstCheck", true);
      firstCheck = true;
      return true;
    } else {
      firstCheck = false;
      return false;
    }
  }

  // Log out
  Future<void> logout(context) async {
    print('logout');
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.remove('customerData');
    currentUser = null;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    notifyListeners();
  }

  getNationality(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getNationalData(context: context);
    print('r > ## $r');
    if (r != null) {
      nationalities = r.data;
      print('nationalities > $nationalities');
      notifyListeners();
    }
    setBusy(false);
  }

  // Get from cache
  Future<User> getFromCache() async {
    print('getFromCache');
    SharedPreferences _pref = await SharedPreferences.getInstance();
    currentUser = User.fromJson(json.decode(_pref.get("customerData")));
    Strings.token = _pref.get("token");
    notifyListeners();
    return currentUser;
  }

// Save in cache
  Future<void> saveInCache(User data, String token) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var d = json.encode(data);
    _pref.setString("customerData", d);
    _pref.setString("token", token);
    print(_pref.getKeys());
    getFromCache();
  }
  // Save in cache profile
  Future<void> saveInCacheProfile(User data) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var d = json.encode(data);
    _pref.setString("customerData", d);
    print(_pref.getKeys());
    getFromCache();
  }

  initScreen(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getSchoolData(context: context);
    print('r > ## $r');
    if (r != null) {
      schools = r.data;
      getNationality(context);
    }
    setBusy(false);
  }

  initEditProfileScreen(context) async {
    initScreen(context);
    editProfile = RegisterModel(
      fullName: currentUser.fullName,
      mobile: currentUser.mobile,
      nationalityId: currentUser.nationalityId,
    );
    notifyListeners();
  }

  Future<void> signInButton(context,isBack) async {
    _loading.init();
    _autoValidate = true;
    if (!_canSubmitLogin) {
      BotToast.closeAllLoading();
    } else {
      _saveSubmitLogin;
      final r = await _api.signIn(context: context, idNumber: idNumber, password: password);
      if (r != null) {
        print('r > ${r.toJson()}');
        BotToast.closeAllLoading();
        currentUser = r.data;
        saveInCache(currentUser, r.data.apiToken);
        notifyListeners();
        if(!isBack)
          Navigator.of(context).pop();
        Navigator.of(context).pop();
      } else {
        BotToast.closeAllLoading();
      }
      BotToast.closeAllLoading();
    }
  }

  Future<void> signUpButton(context) async {
    _loading.init();
    _autoValidate = true;
    register.birthdayrequired = '1';
    if (!_canSubmitLogin) {
      BotToast.closeAllLoading();
    } else {
      _saveSubmitLogin;
      print('register > ${register.toJson()}');
      final r = await _api.signUp(context: context, registerModel: register);
      if (r != null) {
        print('r > ${r.toJson()}');
        BotToast.closeAllLoading();
        currentUser = r.data;
        saveInCache(currentUser, r.data.apiToken);
        notifyListeners();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      } else {
        BotToast.closeAllLoading();
      }
      BotToast.closeAllLoading();
    }
  }

  Future<void> editProfileButton(context) async {
    _loading.init();
    _autoValidate = true;
    // register.birthdayrequired = '1';
    if (!_canSubmitLogin) {
      BotToast.closeAllLoading();
    } else {
      _saveSubmitLogin;
      print('update profile > ${editProfile.toJson()}');
      final r = await _api.updateProfile(context: context, model: editProfile);
      if (r != null) {
        if (r.status == 'done') {
          BotToast.closeAllLoading();
          User _user = User(
            nationalityId: editProfile.nationalityId,
            mobile: editProfile.mobile,
            fullName: editProfile.fullName,
            email: currentUser.email,
            doB: currentUser.doB,
            gender: currentUser.gender,
            idNumber: currentUser.idNumber,
            apiToken: currentUser.apiToken,
            studentId: currentUser.studentId
          );
          saveInCacheProfile(_user);
        }
        // print('r > ${r.toJson()}');
        // BotToast.closeAllLoading();
        // currentUser = r.data;
        // saveInCache(currentUser, r.data.apiToken);
        // notifyListeners();
        // Navigator.of(context).pop();
        // Navigator.of(context).pop();
      } else {
        BotToast.closeAllLoading();
      }
      BotToast.closeAllLoading();
    }
  }
}
