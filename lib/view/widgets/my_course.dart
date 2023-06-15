import 'package:dallah/model/courses.dart';
import 'package:dallah/model/myCourses.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/courses_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../index.dart';

// ignore: must_be_immutable
class MyCourseShape extends StatelessWidget {
  MyCourse data;
  CoursesViewModel model;
  MyCourseShape({this.data,this.model});

  Widget div = Divider(height: 1, color: AppColors.secondaryColor, endIndent: 15, indent: 15);
  TextStyle leadStyle = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    color: const Color(0xff111111),
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'assets/icons/svg/checklist.svg',
                  color: AppColors.primaryColor,
                  height: 25,
                ),
              ),
              Text(
                data.courseName,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
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
              padding: EdgeInsets.all(2),
              child: Column(
                children: [
                  ListTile(
                      leading: Text(translate('start_course'), style: leadStyle),
                      dense: true,
                      trailing: Text( DateFormat('yyyy-MM-dd').format(data.courseStartIn), style: leadStyle)),
                  div,
                  ListTile(
                      leading: Text(translate('end_course'), style: leadStyle),
                      dense: true,
                      trailing: Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(data.courseEnd)), style: leadStyle)),
                  div,
                  ListTile(
                      leading: Text(translate('school'), style: leadStyle), dense: true, trailing: Text(data.schoolName, style: leadStyle)),
                ],
              ))
        ],
      ),
    );
  }
}
