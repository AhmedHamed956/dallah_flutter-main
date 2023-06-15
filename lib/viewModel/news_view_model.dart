import 'package:dallah/core/api/common_api.dart';
import 'package:dallah/model/faq.dart';
import 'package:dallah/model/news.dart';
import 'package:stacked/stacked.dart';
import '../view/index.dart';

class NewsViewModel extends BaseViewModel {
  NewsViewModel();
  final CommonApi _apiCommon = CommonApi.instance;
  List<New> news = [];

  // init ViewModel data
  initScreen(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getNewsData(context);
    if(r.data != null){
      news = r.data;
    }
    setBusy(false);
  }
}
