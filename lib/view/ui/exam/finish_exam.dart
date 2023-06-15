import 'package:avatar_glow/avatar_glow.dart';
import 'package:circle_checkbox/redev_checkbox.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dallah/view/index.dart';
import 'package:dallah/viewModel/courses_view_model.dart';
import 'package:stacked/stacked.dart';

class FinishExam extends StatefulWidget {
  Map<String, List<int>> answers;

  FinishExam(this.answers);

  @override
  _CoursesDallahState createState() => _CoursesDallahState();
}

class _CoursesDallahState extends State<FinishExam> {
  checkResult(text) {
    if (text == 'ناجح') {
      return true;
    } else {
      return false;
    }
  }

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
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ),
        // backgroundColor: AppColors.primaryColor,
        body: ViewModelBuilder<CoursesViewModel>.reactive(
            viewModelBuilder: () => CoursesViewModel(),
            disposeViewModel: false,
            onModelReady: (model) => model.resultExam(context, widget.answers),
            builder: (context, model, child) {
              return SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Stack(
                        fit: StackFit.passthrough,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 250,
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
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: AvatarGlow(
                                  glowColor: Colors.white,
                                  endRadius: 90.0,
                                  duration: Duration(milliseconds: 4000),
                                  repeat: true,
                                  showTwoGlows: true,
                                  repeatPauseDuration: Duration(milliseconds: 50),
                                  child: Material(
                                    // Replace this child with your own
                                    elevation: 8.0,
                                    shape: CircleBorder(),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey[100],
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            translate('result'),
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 18,
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w700,
                                              height: 1.5555555555555556,
                                            ),
                                          ),
                                          Text(
                                            model.resultModel.total.toString(),
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 20,
                                              color:checkResult(model.resultModel.items.toString())
                                                  ? Color(0xff12d639)
                                                  : Color(0xffff0000),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                      radius: 55.0,
                                    ),
                                  ),
                                ),
                              )),
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
                                          left: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  translate('wrong_answers'),
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 12,
                                                    color: const Color(0xffff0000),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(2.0),
                                                      child: Text(
                                                        model.resultModel.danger.toString(),
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
                                                ),
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                          right: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  translate('right_answers'),
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 12,
                                                    color: const Color(0xff12D639),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        model.resultModel.success.toString(),
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
                                                ),
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: -30,
                                          top: 0,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.check_circle,
                                                    size: 50,
                                                    color: checkResult(model.resultModel.items.toString())
                                                        ? Color(0xff12d639)
                                                        : Color(0xffff0000)
                                                  ),
                                                  Text(
                                                    model.resultModel.items.toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      fontSize: 22,
                                                      color: checkResult(model.resultModel.items.toString())
                                                          ? Color(0xff12d639)
                                                          : Color(0xffff0000),
                                                      fontWeight: FontWeight.w700,
                                                      height: 0.9090909090909091,
                                                    ),
                                                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                                    textAlign: TextAlign.center,
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
