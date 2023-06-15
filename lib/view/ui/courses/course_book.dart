import 'package:dallah/model/timeModel.dart';
import 'package:dallah/view/index.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/courses_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class CourseBook extends StatefulWidget {
  @override
  _CoursesDallahState createState() => _CoursesDallahState();
}

class _CoursesDallahState extends State<CourseBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('book_level'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: ViewModelBuilder<CoursesViewModel>.reactive(
            viewModelBuilder: () => CoursesViewModel(),
            disposeViewModel: false,
            onModelReady: (model) => model.evaluation(context),
            builder: (context, model, child) {
              // print(model.listDateEval);
              if (model.isBusy) return ShapeLoading3();
              // if (!model.isEvaluation) return Center(child: Text(translate('service_coming_soon')),);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png', width: 200),
                    GestureDetector(
                      onTap: () => model.selectDate(context),
                      child: ShapeListTile(
                        img: SvgPicture.asset('assets/icons/svg/calendar.svg', color: Colors.white),
                        title: Text(
                          model.selectedDate == null
                              ? translate('date')
                              : DateFormat('dd-MM-yyyy').format(model.selectedDate).toString() ?? translate('date'),
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13,
                            color: const Color(0xff111111),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Dimens.spaceH,
                    ShapeListTile(
                      img: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SvgPicture.asset('assets/icons/svg/counterclockwise-rotation.svg', color: Colors.white),
                      ),
                      title: model.listTimeDate.isEmpty
                          ? Text(translate('times'))
                          : DropdownButton<Result>(
                              // value: model.selectedTimeDate ?? null,
                              isExpanded: true,
                              icon: const Icon(FontAwesomeIcons.angleDown),
                              hint: Text(
                                model.selectedTimeDate.fromH == null || model.selectedTimeDate.toH == null
                                    ? translate('times')
                                    : '${model.selectedTimeDate.fromH} - ${model.selectedTimeDate.toH}' ?? translate('times'),
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 13,
                                  color: const Color(0xff111111),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              iconSize: 24,
                              elevation: 16,
                              underline: Container(),
                              onChanged: (Result newValue) {
                                model.selectedTimeDate = newValue;
                                model.notifyListeners();
                              },
                              items: model.listTimeDate.map<DropdownMenuItem<Result>>((Result value) {
                                return DropdownMenuItem<Result>(
                                  value: value,
                                  child: Text('${value.fromH} - ${value.toH}'),
                                );
                              }).toList(),
                            ),
                    ),
                    Dimens.spaceH,
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: model.isReserveLoad
                                ? ShapeLoading3()
                                : TextButton(
                                    onPressed: () => model.reserveTime(context),
                                    style: TextButton.styleFrom(backgroundColor: AppColors.secondaryColor),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        translate('reserve'),
                                        style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 14,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
