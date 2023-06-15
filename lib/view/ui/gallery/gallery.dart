import 'package:dallah/view/index.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/galleries_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  Widget div = Divider(height: 1, color: AppColors.secondaryColor, endIndent: 15, indent: 15);
  TextStyle leadStyle = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    color: const Color(0xff111111),
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    var lang = localizationDelegate.currentLocale.languageCode;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('gallery'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: ViewModelBuilder<GalleriesViewModel>.reactive(
            viewModelBuilder: () => GalleriesViewModel(),
            disposeViewModel: false,
            onModelReady: (model) => model.initScreen(context),
            builder: (context, model, child) {
              if (model.isBusy) return ShapeLoading3();
              final data = model.list;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final element = data[index];
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: const Color(0xffffffff),
                            border: Border.all(width: 1.0, color: const Color(0xffd8d8d8)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: const Color(0xffd95620),
                                  border: Border.all(width: 1.0, color: const Color(0xffd8d8d8)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      margin: EdgeInsets.all(6),
                                      child: SvgPicture.asset(
                                        'assets/icons/svg/images-interface-symbol.svg',
                                        color: const Color(0xffffffff),
                                        height: 25,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          lang == 'ar' ? element.catname : element.catnameEn,
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 14,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: element.photos
                                    .map((e) => Container(
                                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                          width: MediaQuery.of(context).size.width,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(e.photo), fit: BoxFit.cover),
                                              borderRadius: BorderRadius.all(Radius.circular(15))),
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            }));
  }
}
