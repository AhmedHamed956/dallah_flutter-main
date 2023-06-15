import 'package:dallah/core/api/common_api.dart';
import 'package:dallah/model/faq.dart';
import 'package:stacked/stacked.dart';
import '../view/index.dart';

class FaqViewModel extends BaseViewModel {
  FaqViewModel();
  final CommonApi _apiCommon = CommonApi.instance;
  List<FaqData> faqs = [];

  // init ViewModel data
  initScreen(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getFaqData(context);
    if(r.data != null){
      faqs = r.data;
    }
    setBusy(false);
  }
}
