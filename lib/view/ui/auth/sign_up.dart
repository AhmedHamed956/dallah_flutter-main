import 'package:bot_toast/bot_toast.dart';
import 'package:dallah/core/config/locator.dart';
import 'package:dallah/core/config/validators.dart';
import 'package:dallah/model/nationalityModel.dart';
import 'package:dallah/model/schoolModel.dart';
import 'package:dallah/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:dallah/core/constants/colors.dart';
import 'package:dallah/view/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:stacked/stacked.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    BotToast.closeAllLoading();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('register'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: ViewModelBuilder<AuthViewModel>.reactive(
            viewModelBuilder: () => locator<AuthViewModel>(),
            disposeViewModel: false,
            onModelReady: (model) => model.initScreen(context),
            builder: (context, model, child) {
              return SingleChildScrollView(
                child: Form(
                  key: model.form,
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo.png', width: 200),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.image, color: Colors.white),
                              backgroundColor: AppColors.primaryColor,
                              radius: 35,
                            ),
                            Positioned(
                                bottom: -15,
                                right: -20,
                                child: IconButton(
                                  icon: Icon(Icons.add_circle, color: Colors.blue),
                                  onPressed: () => null,
                                ))
                          ],
                        ),
                      ),
                      ShapeListTile(
                          img: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset('assets/icons/svg/id-icon.svg', color: Colors.white),
                          ),
                          title: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) => Validators.validateForm(value),
                            onChanged: (value) => model.register.idNumber = value,
                            decoration: InputDecoration(hintText: translate('id_number'), border: InputBorder.none),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff111111),
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Dimens.spaceH,
                      ShapeListTile(
                        img: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset('assets/icons/svg/university.svg', color: Colors.white),
                        ),
                        title: model.schools == null
                            ? Text('loading')
                            : DropdownButtonFormField<Datum>(
                                // value: dropdownValue,
                                isExpanded: true,
                                value: null,
                                icon: const Icon(FontAwesomeIcons.angleDown),
                                validator: (value) => value == null ? translate('validation.field_blank') : null,
                                hint: Text(
                                  translate('school'),
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xff111111),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                decoration: InputDecoration(border: InputBorder.none, errorStyle: TextStyle(fontSize: 12, height: 0.6)),
                                onChanged: (Datum newValue) {
                                  model.register.school = newValue.id.toString();
                                },
                                items: model.schools.map<DropdownMenuItem<Datum>>((Datum value) {
                                  return DropdownMenuItem<Datum>(
                                    value: value,
                                    child: Text(
                                      value.name,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                              ),
                      ),
                      Dimens.spaceH,
                      ShapeListTile(
                          img: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset('assets/icons/svg/user.svg', color: Colors.white),
                          ),
                          title: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (value) => Validators.validateName(value),
                            onChanged: (value) => model.register.fullName = value,
                            decoration: InputDecoration(hintText: translate('full_name'), border: InputBorder.none),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff111111),
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Dimens.spaceH,
                      ShapeListTile(
                          img: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset('assets/icons/svg/mail.svg', color: Colors.white),
                          ),
                          title: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => Validators.validateEmail(value),
                            onChanged: (value) => model.register.email = value,
                            decoration: InputDecoration(hintText: translate('email'), border: InputBorder.none),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff111111),
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Dimens.spaceH,
                      ShapeListTile(
                          img: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.calendar_today, color: Colors.white),
                          ),
                          title: TextFormField(
                            keyboardType: TextInputType.datetime,
                            validator: (value) => Validators.validateForm(value),
                            controller: model.controllerBirthDay,
                            readOnly: true,
                            onTap: () {
                              setState(() async {
                                DateTime date = DateTime(1900);
                                date = await showDatePicker(
                                    builder: (BuildContext context, Widget child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: AppColors.primaryColor,
                                          accentColor: AppColors.secondaryColor,
                                        ),
                                        child: child,
                                      );
                                    },
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));

                                model.register.birthday = DateFormat('yyyy-MM-dd').format(date);
                                model.controllerBirthDay.text = DateFormat('yyyy-MM-dd').format(date);
                              });
                            },
                            decoration: InputDecoration(hintText: translate('birth_date'), border: InputBorder.none),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff111111),
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Dimens.spaceH,
                      ShapeListTile(
                          img: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset('assets/icons/svg/smartphone-call.svg', color: Colors.white),
                          ),
                          title: TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (value) => Validators.validatePhone(value),
                            onChanged: (value) => model.register.mobile = value,
                            decoration: InputDecoration(hintText: translate('phone'), border: InputBorder.none),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff111111),
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Dimens.spaceH,
                      ShapeListTile(
                          img: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset('assets/icons/svg/lock.svg', color: Colors.white),
                          ),
                          title: TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (value) => Validators.validateForm(value),
                            onChanged: (value) => model.register.password = value,
                            decoration: InputDecoration(hintText: translate('password'), border: InputBorder.none),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff111111),
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Dimens.spaceH,
                      ShapeListTile(
                        img: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset('assets/icons/svg/world.svg', color: Colors.white),
                        ),
                        title: model.nationalities == null
                            ? Text('loading')
                            : DropdownButtonFormField<National>(
                                // value: dropdownValue,
                                isExpanded: true,
                                value: null,
                                icon: const Icon(FontAwesomeIcons.angleDown),
                                validator: (value) => value == null ? translate('validation.field_blank') : null,
                                hint: Text(
                                  translate('national'),
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: const Color(0xff111111),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                decoration: InputDecoration(border: InputBorder.none, errorStyle: TextStyle(fontSize: 12, height: 0.6)),
                                onChanged: (National newValue) {
                                  model.register.nationalityId = newValue.id.toString();
                                },
                                items: model.nationalities.map<DropdownMenuItem<National>>((National value) {
                                  return DropdownMenuItem<National>(
                                    value: value,
                                    child: Text(
                                      value.name,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                              ),
                      ),
                      Dimens.spaceH,
                      ShapeListTile(
                        img: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset('assets/icons/svg/user.svg', color: Colors.white),
                        ),
                        title: DropdownButtonFormField<String>(
                          // value: dropdownValue,
                          isExpanded: true,
                          icon: const Icon(FontAwesomeIcons.angleDown),
                          validator: (value) => value == null ? translate('validation.field_blank') : null,
                          isDense: true,
                          hint: Text(
                            translate('gender'),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: const Color(0xff111111),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          decoration: InputDecoration(border: InputBorder.none, errorStyle: TextStyle(fontSize: 12, height: 0.6)),
                          iconSize: 24,
                          elevation: 16,
                          // decoration: InputDecoration(border: InputBorder.none),
                          // underline: Container(),
                          onChanged: (String newValue) {
                            print('newValue > $newValue');
                            model.register.gender = newValue;
                          },
                          items: <String>['male', 'female'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                translate(value),
                                style: TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Dimens.spaceH,
                      CheckboxListTile(
                        value: true,
                        activeColor: AppColors.primaryColor,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          ' اقر بصحة جميع البيانات التي قمت بإدخالها و اتحمل المسئولية كاملة اذا ثبت عكس ذلك و اتعهد بإحضار اصل (بطاقة الأحوال / الاقامة) للمطابقة قبل بدء التدريب',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 12,
                            color: const Color(0xff111111),
                            fontWeight: FontWeight.w700,
                            height: 1.3333333333333333,
                          ),
                          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                        onChanged: (value) => null,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () => model.signUpButton(context),
                                  style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
                                  child: Text(
                                    translate('register'),
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 12,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
