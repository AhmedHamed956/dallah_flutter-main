import 'package:dallah/core/config/locator.dart';
import 'package:dallah/view/index.dart';
import 'package:dallah/view/ui/auth/profile.dart';
import 'package:dallah/view/ui/auth/sign_up.dart';
import 'package:dallah/view/ui/courses/course_book.dart';
import 'package:dallah/view/ui/courses/course_hour.dart';
import 'package:dallah/view/ui/courses/course_paid.dart';
import 'package:dallah/view/ui/exam/exam.dart';
import 'package:dallah/view/ui/video/video.dart';
import 'package:dallah/view/ui/who_are_we/who.dart';
import 'package:dallah/viewModel/auth_view_model.dart';
import 'package:dallah/viewModel/courses_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('user'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', width: 200),
                ],
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 1.5,
              //   child: GestureDetector(
              //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesPaid())),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(10),
              //         child: Container(
              //           height: 60,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(9.0),
              //               bottomLeft: Radius.circular(9.0),
              //             ),
              //             color: AppColors.primaryColor,
              //             border: Border.all(width: 1.0, color: const Color(0xffb4b4b4)),
              //           ),
              //           child: Row(
              //             children: <Widget>[
              //               Container(
              //                   color: AppColors.primaryColor,
              //                   width: 60,
              //                   height: 60,
              //                   padding: EdgeInsets.all(10),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(5.0),
              //                     child: SvgPicture.asset('assets/icons/svg/customer.svg', color: Colors.white),
              //                   )),
              //               Expanded(
              //                   child: Center(
              //                 child: Text(
              //                   translate('courses_paid'),
              //                   style: TextStyle(
              //                     fontFamily: 'Cairo',
              //                     fontSize: 15,
              //                     color: const Color(0xffffffff),
              //                     fontWeight: FontWeight.w700,
              //                     height: 1.2,
              //                   ),
              //                   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              //                   // textAlign: TextAlign.right,
              //                 ),
              //               )),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: ViewModelBuilder<CoursesViewModel>.reactive(
                    viewModelBuilder: () => CoursesViewModel(),
                    disposeViewModel: false,
                    builder: (context, model, child) {
                      return GestureDetector(
                        onTap: () => model.initScreen(context),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(9.0),
                                  bottomLeft: Radius.circular(9.0),
                                ),
                                color: AppColors.primaryColor,
                                border: Border.all(width: 1.0, color: const Color(0xffb4b4b4)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      color: AppColors.primaryColor,
                                      width: 60,
                                      height: 60,
                                      padding: EdgeInsets.all(10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SvgPicture.asset('assets/icons/svg/checklist.svg', color: Colors.white),
                                      )),
                                  Expanded(
                                      child: Center(
                                    child: Text(
                                      translate('course_30'),
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 15,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CourseBook())),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(9.0),
                            bottomLeft: Radius.circular(9.0),
                          ),
                          color: AppColors.primaryColor,
                          border: Border.all(width: 1.0, color: const Color(0xffb4b4b4)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                                color: AppColors.primaryColor,
                                width: 60,
                                height: 60,
                                padding: EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset('assets/icons/svg/calendar.svg', color: Colors.white),
                                )),
                            Expanded(
                                child: Center(
                              child: Text(
                                translate('book_level'),
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 1.5,
              //   child: GestureDetector(
              //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exam())),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(10),
              //         child: Container(
              //           height: 60,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(9.0),
              //               bottomLeft: Radius.circular(9.0),
              //             ),
              //             color: AppColors.primaryColor,
              //             border: Border.all(width: 1.0, color: const Color(0xffb4b4b4)),
              //           ),
              //           child: Row(
              //             children: <Widget>[
              //               Container(
              //                   color: AppColors.primaryColor,
              //                   width: 60,
              //                   height: 60,
              //                   padding: EdgeInsets.all(10),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(5.0),
              //                     child: SvgPicture.asset('assets/icons/svg/clipboards.svg', color: Colors.white),
              //                   )),
              //               Expanded(
              //                   child: Center(
              //                 child: Text(
              //                   translate('paper_test'),
              //                   style: TextStyle(
              //                     fontFamily: 'Cairo',
              //                     fontSize: 15,
              //                     color: const Color(0xffffffff),
              //                     fontWeight: FontWeight.w700,
              //                     height: 1.2,
              //                   ),
              //                   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              //                   textAlign: TextAlign.center,
              //                 ),
              //               )),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 1.5,
              //   child: GestureDetector(
              //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Video())),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(10),
              //         child: Container(
              //           height: 60,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(9.0),
              //               bottomLeft: Radius.circular(9.0),
              //             ),
              //             color: AppColors.primaryColor,
              //             border: Border.all(width: 1.0, color: const Color(0xffb4b4b4)),
              //           ),
              //           child: Row(
              //             children: <Widget>[
              //               Container(
              //                   color: AppColors.primaryColor,
              //                   width: 60,
              //                   height: 60,
              //                   padding: EdgeInsets.all(10),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(5.0),
              //                     child: SvgPicture.asset('assets/icons/svg/video-camera.svg', color: Colors.white),
              //                   )),
              //               Expanded(
              //                   child: Center(
              //                 child: Text(
              //                   translate('video'),
              //                   style: TextStyle(
              //                     fontFamily: 'Cairo',
              //                     fontSize: 15,
              //                     color: const Color(0xffffffff),
              //                     fontWeight: FontWeight.w700,
              //                     height: 1.2,
              //                   ),
              //                   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              //                   textAlign: TextAlign.center,
              //                 ),
              //               )),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Profile())),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(9.0),
                            bottomLeft: Radius.circular(9.0),
                          ),
                          color: AppColors.primaryColor,
                          border: Border.all(width: 1.0, color: const Color(0xffb4b4b4)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                                color: AppColors.primaryColor,
                                width: 60,
                                height: 60,
                                padding: EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset('assets/icons/svg/user.svg', color: Colors.white),
                                )),
                            Expanded(
                                child: Center(
                              child: Text(
                                translate('edit_profile'),
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                textAlign: TextAlign.right,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
