// import 'package:dallah/view/index.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class CoursesDallah extends StatefulWidget {
//   @override
//   _CoursesDallahState createState() => _CoursesDallahState();
// }
//
// class _CoursesDallahState extends State<CoursesDallah> {
//   String dropdownValue = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             translate('courses_dallah'),
//             style: TextStyle(
//               fontFamily: 'Cairo',
//               fontSize: 21,
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: AppColors.secondaryColor,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Image.asset('assets/images/logo.png', width: 200),
//               ShapeListTile(
//                 img: SvgPicture.asset('assets/icons/svg/checklist.svg', color: Colors.white),
//                 title: DropdownButton<String>(
//                   // value: dropdownValue,
//                   isExpanded: true,
//                   icon: const Icon(FontAwesomeIcons.angleDown),
//                   hint: Text(
//                     'نوع الدورة',
//                     style: TextStyle(
//                       fontFamily: 'Cairo',
//                       fontSize: 13,
//                       color: const Color(0xff111111),
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   iconSize: 24,
//                   elevation: 16,
//                   underline: Container(),
//                   onChanged: (String newValue) {
//                     setState(() {
//                       dropdownValue = newValue;
//                     });
//                   },
//                   items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               Dimens.spaceH,
//               ShapeListTile(
//                 img: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: SvgPicture.asset('assets/icons/svg/map-pin-marked.svg', color: Colors.white),
//                 ),
//                 title: DropdownButton<String>(
//                   // value: dropdownValue,
//                   isExpanded: true,
//                   icon: const Icon(FontAwesomeIcons.angleDown),
//                   hint: Text(
//                     'المكان',
//                     style: TextStyle(
//                       fontFamily: 'Cairo',
//                       fontSize: 13,
//                       color: const Color(0xff111111),
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   iconSize: 24,
//                   elevation: 16,
//                   underline: Container(),
//                   onChanged: (String newValue) {
//                     setState(() {
//                       dropdownValue = newValue;
//                     });
//                   },
//                   items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               Dimens.spaceH,
//               Text(
//                 'بداية من',
//                 style: TextStyle(
//                   fontFamily: 'Cairo',
//                   fontSize: 15,
//                   color: const Color(0xff111111),
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ShapeListTile(
//                       img: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: SvgPicture.asset('assets/icons/svg/calendar.svg', color: Colors.white),
//                       ),
//                       title: DropdownButton<String>(
//                         // value: dropdownValue,
//                         isExpanded: true,
//                         icon: const Icon(FontAwesomeIcons.angleDown),
//                         hint: Text(
//                           'من',
//                           style: TextStyle(
//                             fontFamily: 'Cairo',
//                             fontSize: 13,
//                             color: const Color(0xff111111),
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         iconSize: 24,
//                         elevation: 16,
//                         underline: Container(),
//                         onChanged: (String newValue) {
//                           setState(() {
//                             dropdownValue = newValue;
//                           });
//                         },
//                         items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ShapeListTile(
//                       img: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: SvgPicture.asset('assets/icons/svg/calendar.svg', color: Colors.white),
//                       ),
//                       title: DropdownButton<String>(
//                         // value: dropdownValue,
//                         isExpanded: true,
//                         icon: const Icon(FontAwesomeIcons.angleDown),
//                         hint: Text(
//                           'الي',
//                           style: TextStyle(
//                             fontFamily: 'Cairo',
//                             fontSize: 13,
//                             color: const Color(0xff111111),
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         iconSize: 24,
//                         elevation: 16,
//                         underline: Container(),
//                         onChanged: (String newValue) {
//                           setState(() {
//                             dropdownValue = newValue;
//                           });
//                         },
//                         items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextButton(
//                           onPressed: () => null,
//                           style: TextButton.styleFrom(backgroundColor: AppColors.secondaryColor),
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: Text(
//                               'بحث',
//                               style: TextStyle(
//                                 fontFamily: 'Cairo',
//                                 fontSize: 14,
//                                 color: const Color(0xffffffff),
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//               Dimens.spaceH,
//               ShapeCourse(),
//               ShapeCourse(),
//             ],
//           ),
//         ));
//   }
// }
