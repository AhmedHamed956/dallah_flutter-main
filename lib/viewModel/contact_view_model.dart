import 'package:bot_toast/bot_toast.dart';
import 'package:dallah/core/api/common_api.dart';
import 'package:dallah/core/config/handlin_error.dart';
import 'package:dallah/model/faq.dart';
import 'package:dallah/model/news.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:stacked/stacked.dart';
import '../view/index.dart';

class ContactUsViewModel extends BaseViewModel {
  ContactUsViewModel();

  final CommonApi _apiCommon = CommonApi.instance;
  final HandlingError handle = HandlingError.handle;
  final Loading _loading = Loading();

  bool _autoValidate = false;
  bool get autoValidate => _autoValidate;

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  bool get _canSubmitLogin => form.currentState.validate();
  void get _saveSubmitLogin => form.currentState.save();

  String name, email, phone, message;

  Future<void> sendContactUs(context) async {
    _loading.init();
    _autoValidate = true;
    if (!_canSubmitLogin) {
      BotToast.closeAllLoading();
    } else {
      _saveSubmitLogin;
      final r = await _apiCommon.contactUs(context, name, email, phone, message);
      if (r != null) {
        print('r > ${r.toJson()}');
        BotToast.showText(
          text: r.message,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          textStyle: TextStyle(fontSize: 14, color: Colors.white),
          contentColor: AppColors.greenColor,
          contentPadding: EdgeInsets.all(10),
        );
        form.currentState.reset();
      } else {
        BotToast.closeAllLoading();
      }
      BotToast.closeAllLoading();
    }
  }
}
