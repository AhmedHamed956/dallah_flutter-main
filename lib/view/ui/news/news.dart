import 'package:dallah/view/index.dart';
import 'package:dallah/view/ui/news/news_details.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/news_view_model.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
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
            translate('news'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: ViewModelBuilder<NewsViewModel>.reactive(
            viewModelBuilder: () => NewsViewModel(),
            disposeViewModel: false,
            onModelReady: (model) => model.initScreen(context),
            builder: (context, model, child) {
              if (model.isBusy) return ShapeLoading3();
              final data = model.news;
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
                              Padding(
                                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                                child: Row(
                                  children: [
                                    Icon(FontAwesomeIcons.solidCalendarAlt, color: AppColors.primaryColor, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                      DateFormat('yyyy/MM/dd').format(element.createdAt),
                                      style: TextStyle(
                                        fontFamily: 'Al-Jazeera-Arabic-Regular',
                                        fontSize: 12,
                                        color: const Color(0xff000000),
                                      ),
                                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8.0),
                                  child: Expanded(
                                    child: Center(
                                        child: Text(
                                      lang == 'ar' ? element.titleAr : element.title,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 13,
                                        color: const Color(0xffffffff),
                                        letterSpacing: 0.13,
                                        height: 1.3846153846153846,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                                  ),
                                ),
                              ),
                              Image.network(element.photo),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: HtmlWidget(
                                  lang == 'ar' ? element.contentAr : element.content,
                                  textStyle:  TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xff000000),
                                    letterSpacing: 0.13,
                                    height: 1.3846153846153846,
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetails(element))),
                                  style: TextButton.styleFrom(backgroundColor: AppColors.secondaryColor, minimumSize: Size(150, 30)),
                                  child: Text(
                                    translate('more'),
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 12,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    );
                  });
            }));
  }
}
