import 'dart:math';

import 'package:circle_checkbox/redev_checkbox.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dallah/view/index.dart';
import 'package:dallah/view/ui/exam/finish_exam.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/courses_view_model.dart';
import 'package:stacked/stacked.dart';

class StartExam extends StatefulWidget {
  String lang;

  StartExam(this.lang);

  @override
  _CoursesDallahState createState() => _CoursesDallahState();
}

class _CoursesDallahState extends State<StartExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('paper_test'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        // backgroundColor: AppColors.primaryColor,
        body: ViewModelBuilder<CoursesViewModel>.reactive(
            viewModelBuilder: () => CoursesViewModel(),
            disposeViewModel: false,
            onModelReady: (model) => model.startExam(context, widget.lang),
            builder: (context, model, child) {
              if (model.isBusy) return ShapeLoading3();
              final data = model.listExam;
              return SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  // color: Colors.white,
                  child: Column(
                    children: [
                      Stack(
                        fit: StackFit.passthrough,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.0)),
                              color: const Color(0xffd95620),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: -80,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  height: MediaQuery.of(context).size.width / 2.5,
                                  width: MediaQuery.of(context).size.width / 1.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: const Color(0xffffffff),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x29000000),
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: Stack(
                                    fit: StackFit.passthrough,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                          top: -50,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: const Color(0x29000000),
                                                    offset: Offset(0, 3),
                                                    blurRadius: 6,
                                                  ),
                                                ],
                                              ),
                                              padding: EdgeInsets.all(10),
                                              child: SizedBox(
                                                  height: 80,
                                                  width: 80,
                                                  child: CircularCountDownTimer(
                                                    duration: 2400,
                                                    initialDuration: 0,
                                                    controller: CountDownController(),
                                                    width: MediaQuery.of(context).size.width / 2,
                                                    height: MediaQuery.of(context).size.height / 2,
                                                    ringColor: Colors.grey[300],
                                                    ringGradient: null,
                                                    fillColor: AppColors.primaryColor,
                                                    fillGradient: null,
                                                    backgroundColor: Colors.white,
                                                    backgroundGradient: null,
                                                    strokeWidth: 10.0,
                                                    strokeCap: StrokeCap.round,
                                                    textStyle: TextStyle(
                                                        fontSize: 15.0, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                                                    textFormat: CountdownTextFormat.HH_MM_SS,
                                                    isReverse: true,
                                                    isReverseAnimation: true,
                                                    isTimerTextShown: true,
                                                    autoStart: true,
                                                    onStart: () {
                                                      print('Countdown Started');
                                                    },
                                                    onComplete: () {
                                                      print('Countdown Ended');
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => FinishExam(model.answers)));
                                                    },
                                                  )),
                                            ),
                                          )),
                                      Positioned(
                                          left: 10,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '${model.wrongAns}',
                                                  style: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 18,
                                                    color: const Color(0xffff0000),
                                                    height: 1.5,
                                                  ),
                                                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(14.0),
                                                  color: const Color(0xffff0000),
                                                ),
                                              ),
                                            ],
                                          )),
                                      Positioned(
                                          right: 10,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '${model.correctAns}',
                                                  style: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 18,
                                                    color: const Color(0xff12D639),
                                                    height: 1.5,
                                                  ),
                                                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(14.0),
                                                  color: const Color(0xff12D639),
                                                ),
                                              ),
                                            ],
                                          )),
                                      Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          top: 0,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'سؤال رقم',
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontSize: 14,
                                                  color: const Color(0xffd95620),
                                                  height: 1.5,
                                                ),
                                                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                                textAlign: TextAlign.right,
                                              ),
                                              Dimens.spaceW,
                                              Stack(
                                                fit: StackFit.passthrough,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  CircleAvatar(
                                                    child: Text(
                                                      (model.index + 1).toString(),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        fontSize: 20,
                                                        color: const Color(0xffffffff),
                                                        height: 1.5,
                                                      ),
                                                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                                      textAlign: TextAlign.right,
                                                    ),
                                                    maxRadius: 16,
                                                    backgroundColor: AppColors.primaryColor,
                                                  ),
                                                  Positioned(
                                                      left: -16,
                                                      bottom: -13,
                                                      child: CircleAvatar(
                                                        backgroundColor: Colors.grey,
                                                        maxRadius: 12,
                                                        child: Text(
                                                          data.length.toString(),
                                                          style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            fontSize: 13,
                                                            color: const Color(0xffffffff),
                                                          ),
                                                          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                                          textAlign: TextAlign.right,
                                                        ),
                                                      ))
                                                ],
                                              )
                                            ],
                                          )),
                                      Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          // top: 0,
                                          child: Center(
                                            child: Container(
                                              height: 40,
                                              padding: EdgeInsets.symmetric(horizontal: 12),
                                              width: MediaQuery.of(context).size.width,
                                              alignment: Alignment.center,
                                              child: Text(
                                                data[model.index].name.toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontSize: 13,
                                                  color: const Color(0xff000000),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 100),
                      Container(
                        height: 400,
                        child: PageView.builder(
                          controller: model.pageController,
                          physics: new NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final element = data[index];
                            return SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    if (element.photo != '')
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: const Color(0xffffffff),
                                          border: Border.all(width: 1.0, color: const Color(0xffb4b4b4)),
                                        ),
                                        width: 200,
                                        height: 100,
                                        child: Image.network(
                                          element.photo,
                                          errorBuilder: (context, error, stackTrace) => Center(
                                            child: Column(
                                              children: [
                                                Icon(Icons.info, color: Colors.grey),
                                                Text('Error in image', style: TextStyle(color: Colors.grey))
                                              ],
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (element.photo != '') Dimens.spaceH,
                                    Column(
                                      children: element.asw
                                          .map(
                                            (e) => Column(
                                              children: [
                                                CircleCheckboxListTile(
                                                  title: Text(e.name.toString(), style: TextStyle(fontSize: 16)),
                                                  value: e.check|| e.checkCorrect == 1|| e.checkCorrect == 1 ? true:false,
                                                  activeColor: e.checkCorrect == 0
                                                      ? Color(0xFFB4B4B4)
                                                      : e.checkCorrect == 1
                                                          ? Colors.green
                                                          : Colors.red,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      e.check = value;
                                                      element.asw.forEach((ans) {
                                                        if (e != ans) {
                                                          ans.check = false;
                                                        }
                                                      });
                                                    });
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(color: e.checkCorrect == 0
                                                          ? Color(0xFFB4B4B4)
                                                          : e.checkCorrect == 1
                                                          ? Colors.green
                                                          : Colors.red, width: 1),
                                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                                ),
                                                Dimens.spaceH,
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    Dimens.spaceH,
                                    Dimens.spaceH,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                              onPressed: () {
                                                // print(data.length);
                                                // print(index);
                                                model.checkAnswer(context, element);
                                              },
                                              style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(
                                                  translate('next'),
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 14,
                                                    color: const Color(0xffffffff),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
