import 'package:stacked/stacked.dart';
import '../view/index.dart';

class NewViewModel extends BaseViewModel {
  NewViewModel();

  // init ViewModel data
  initScreen(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    // final r = await _api.getData(context);
    setBusy(false);
  }
}
