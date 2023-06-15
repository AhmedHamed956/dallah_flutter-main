import 'package:dallah/core/api/common_api.dart';
import 'package:dallah/model/branches.dart';
import 'package:dallah/model/faq.dart';
import 'package:dallah/model/news.dart';
import 'package:stacked/stacked.dart';
import '../view/index.dart';

class BranchesViewModel extends BaseViewModel {
  BranchesViewModel();
  final CommonApi _apiCommon = CommonApi.instance;
  List<Branch> branches = [];

  // init ViewModel data
  initScreen(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getBranchesData(context);
    if(r.data != null){
      branches = r.data;
    }
    setBusy(false);
  }
}
