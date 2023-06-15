import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_flags/circle_flags.dart';
import 'package:dallah/core/config/locator.dart';
import 'package:dallah/view/ui/branches/branches.dart';
import 'package:dallah/view/ui/businessHour/business_hour.dart';
import 'package:dallah/view/ui/contact/contact.dart';
import 'package:dallah/view/ui/courses/course_dallah.dart';
import 'package:dallah/view/ui/courses/course_paid.dart';
import 'package:dallah/view/ui/faq/faq.dart';
import 'package:dallah/view/ui/gallery/gallery.dart';
import 'package:dallah/view/ui/news/news.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/auth_view_model.dart';
import 'package:dallah/viewModel/galleries_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import '../../index.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;

  List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    var lang = localizationDelegate.currentLocale.languageCode;
    final _auth = locator<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
          title: Image.asset('assets/images/logo.png', width: 90),
          centerTitle: true,
          elevation: 1,
          actions: [
            IconButton(
                icon: lang == 'ar' ? CircleFlag('sa') : CircleFlag('gb'),
                padding: EdgeInsets.all(10),
                onPressed: () {
                  if (lang == 'ar') {
                    changeLocale(context, 'en');
                  } else {
                    changeLocale(context, 'ar');
                  }
                })
          ]),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          ViewModelBuilder<GalleriesViewModel>.reactive(
              viewModelBuilder: () => GalleriesViewModel(),
              disposeViewModel: false,
              onModelReady: (model) => model.getSliders(context),
              builder: (context, model, child) {
                return Column(children: [
                  if (model.slidersModel.data != null)
                    CarouselSlider(
                      items: model.slidersModel.data
                          .map((item) => Container(
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0.0)),
                                    child: Image.network(
                                      model.slidersModel.path + item.photo,
                                      fit: BoxFit.cover,
                                      width: 1000.0,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Center(
                                        child: Column(
                                          children: [
                                            Icon(Icons.info,
                                                color: Colors.grey),
                                            Text('Error in image',
                                                style: TextStyle(
                                                    color: Colors.grey))
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                        ),
                                      ),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return ShapeLoading2();
                                      },
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: false,
                          aspectRatio: 2.5,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    )
                  else
                    ShapeLoading3(),
                  if (model.slidersModel.data != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: model.slidersModel.data.map((url) {
                        int index = model.slidersModel.data.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? AppColors.primaryColor
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    )
                ]);
              }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10),
                children: [
                  shapeBox(
                      image: 'assets/icons/svg/faq.svg',
                      text: 'faq',
                      function: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Faq()))),
                  shapeBox(
                      image: 'assets/icons/svg/padlock.svg',
                      text: 'courses_paid',
                      function: () {
                        if (_auth.currentUser != null) {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CoursesPaid()));
                        } else {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn(true)));
                        }
                      }),
                  shapeBox(
                      image: 'assets/icons/svg/newspaper.svg',
                      text: 'newspaper_dallah',
                      function: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => News()))),
                  // shapeBox(
                  //     image: 'assets/icons/svg/checklist.svg',
                  //     text: 'courses_dallah',
                  //     function: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesDallah()))),
                  shapeBox(
                      image: 'assets/icons/svg/map-pin-marked.svg',
                      text: 'branches',
                      function: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Branches()))),
                  shapeBox(
                      image: 'assets/icons/svg/images-interface-symbol.svg',
                      text: 'gallery',
                      function: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gallery()))),
                  shapeBox(
                      image: 'assets/icons/svg/phone-call.svg',
                      text: 'call_us',
                      function: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactUs()))),
                  // shapeBox(
                  //     image: 'assets/icons/svg/counterclockwise-rotation.svg',
                  //     text: 'time',
                  //     function: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessHour()))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget shapeBox({String image, String text, Function function}) {
    return GestureDetector(
      onTap: function,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: AppColors.primaryColor,
          ),
          // width: 100,
          // height: 100,
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: SvgPicture.asset(image, height: 50), flex: 2),
              Expanded(
                  child: Text(
                translate(text),
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 15,
                  color: const Color(0xffffffff),
                  letterSpacing: 0.135,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
