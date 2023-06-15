import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:dallah/core/constants/colors.dart';
import 'package:dallah/view/index.dart';

class BusinessHour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('time'),
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
                    Row(
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
                            'assets/icons/svg/counterclockwise-rotation.svg',
                            color: AppColors.primaryColor,
                            height: 25,
                          ),
                        ),
                        Text(
                          'أوقات العمل الرسمية لشركة دله لتعليم قيادة السيارات',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
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
                      child: Text(
                        '\nﻣﻦ اﻷﺣﺪ ﺇﻟﻰ اﻟﺨﻤﻴﺲ – ﻣﻦ 07:00 ﺻﺒﺎﺣﺎً ﺇﻟﻰ 09:00 ﻣﺴﺎءا\n\nاوقات التسجيل في الفروع من الساعة ٨ صباحا الي الساعه ٢ ظهرا\n\nأيام العطل : اﻟﺠﻤﻌﺔ و اﻟﺴﺒﺖ',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 12,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          height: 1.4545454545454546,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
