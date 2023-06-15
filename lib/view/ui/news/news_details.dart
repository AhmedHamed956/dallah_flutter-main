import 'package:dallah/model/news.dart';
import 'package:dallah/view/index.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class NewsDetails extends StatefulWidget {
  New element;

  NewsDetails(this.element);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsDetails> {
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

    final data = widget.element;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('news_details'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  // color: const Color(0xffffffff),
                  // border: Border.all(width: 1.0, color: const Color(0xffd8d8d8)),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: const Color(0x29000000),
                  //     offset: Offset(0, 3),
                  //     blurRadius: 6,
                  //   ),
                  // ],
                ),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.solidCalendarAlt,color: AppColors.primaryColor,size: 18),
                          SizedBox(width: 5),
                          Text(
                            DateFormat('yyyy/MM/dd').format(data.createdAt),
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
                                lang == 'ar' ? data.titleAr : data.title,
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
                    Image.network(data.photo),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:HtmlWidget(
                        lang == 'ar' ? data.contentAr : data.content,
                        textStyle:  TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          color: const Color(0xff000000),
                          letterSpacing: 0.13,
                          height: 1.3846153846153846,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
