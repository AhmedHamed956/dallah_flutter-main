import 'package:dallah/core/api/common_api.dart';
import 'package:dallah/model/faq.dart';
import 'package:dallah/model/galleries.dart';
import 'package:dallah/model/news.dart';
import 'package:dallah/model/pages.dart';
import 'package:dallah/model/sliders.dart';
import 'package:stacked/stacked.dart';
import '../view/index.dart';

class GalleriesViewModel extends BaseViewModel {
  GalleriesViewModel();

  final CommonApi _apiCommon = CommonApi.instance;
  List<Gallery> list = [];
  SlidersModel slidersModel = SlidersModel();
  PagesModel pagesModel = PagesModel();
  List<String> listImages = [];

  // init ViewModel data
  initScreen(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getGalleriesData(context);
    if (r.data != null) {
      list = r.data;
      list.forEach((element) {
        element.photos.forEach((element) {
          listImages.add(element.photo);
        });
      });
    }
    setBusy(false);
  }

  // init ViewModel data
  getSliders(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getSlidersData(context);
    if (r.data != null) {
      slidersModel = r;
    }
    setBusy(false);
  }

  // init ViewModel data
  getAboutUs(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getAboutUsData(context);
    if (r.data != null) {
      pagesModel = r;
    }
    setBusy(false);
  }
  // init ViewModel data
  getService(context) async {
    print('### Init ${this.runtimeType} ###');
    setBusy(true);
    final r = await _apiCommon.getServiceData(context);
    if (r.data != null) {
      pagesModel = r;
    }
    setBusy(false);
  }
}
