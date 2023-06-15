import 'package:dallah/view/index.dart';
import 'package:dallah/view/ui/exam/start_exam.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Exam extends StatefulWidget {
  @override
  _CoursesDallahState createState() => _CoursesDallahState();
}

class _CoursesDallahState extends State<Exam> {
  String dropdownValue = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('lang_test'),
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
        backgroundColor:  AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(heightFactor: 2,child: Icon(Icons.g_translate_sharp, size: 80,color: Colors.white,)),
              Dimens.spaceH,
              ShapeListTile(
                img: null,
                title: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  icon: const Icon(FontAwesomeIcons.angleDown),
                  hint: Center(
                    child: Text(
                      translate('select_lang'),
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 13,
                        color: const Color(0xff111111),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['ar', 'en'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(child: Text(translate(value))),
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
                      child: TextButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StartExam(dropdownValue))),
                          style: TextButton.styleFrom(backgroundColor: AppColors.secondaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              translate('go'),
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
        ));
  }
}
