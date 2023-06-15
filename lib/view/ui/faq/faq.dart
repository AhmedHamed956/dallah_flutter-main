import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/faq_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:dallah/core/constants/colors.dart';
import 'package:dallah/view/index.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:stacked/stacked.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    var lang = localizationDelegate.currentLocale.languageCode;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('faq'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: ViewModelBuilder<FaqViewModel>.reactive(
            viewModelBuilder: () => FaqViewModel(),
            disposeViewModel: false,
            onModelReady: (model) => model.initScreen(context),
            builder: (context, model, child) {
              if(model.isBusy) return ShapeLoading3();
              final data = model.faqs;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final element = data[index];
                    return Column(
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
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: const Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x29000000),
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(4),
                                    margin: EdgeInsets.all(6),
                                    child: SvgPicture.asset(
                                      'assets/icons/svg/faq.svg',
                                      color: AppColors.primaryColor,
                                      height: 25,
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.2,
                                    child: Text(
                                      lang == 'ar' ? element.questionAr:element.question,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 12,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                child: HtmlWidget(
                                  lang == 'ar' ? element.answerAr:element.answer,
                                  textStyle: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 12,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  });
            }));
  }
}
