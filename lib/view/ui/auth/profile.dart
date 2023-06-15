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

class Profile extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Profile> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    BotToast.closeAllLoading();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('profile'),
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
            onModelReady: (model) => model.initEditProfileScreen(context),
            builder: (context, model, child) {
              // print(model.currentUser.toJson());
              return SingleChildScrollView(
                child: Form(
                  key: model.form,
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo.png', width: 200),
                      Dimens.spaceH,
                      ShapeListTile(
                          img: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset('assets/icons/svg/user.svg', color: Colors.white),
                          ),
                          title: TextFormField(
                            initialValue: model.currentUser.fullName.toString(),
                            keyboardType: TextInputType.text,
                            validator: (value) => Validators.validateName(value),
                            onChanged: (value) => model.editProfile.fullName = value,
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
                            child: SvgPicture.asset('assets/icons/svg/smartphone-call.svg', color: Colors.white),
                          ),
                          title: TextFormField(
                            initialValue: model.currentUser.mobile.toString(),
                            keyboardType: TextInputType.phone,
                            validator: (value) => Validators.validatePhone(value),
                            onChanged: (value) => model.editProfile.mobile = value,
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
                            // validator: (value) => Validators.validateForm(value),
                            onChanged: (value) => model.editProfile.password = value,
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
                                value: model.nationalities.elementAt(0),
                                isExpanded: true,
                                // value: null,
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
                                  model.editProfile.nationalityId = newValue.id.toString();
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () => model.editProfileButton(context),
                                  style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
                                  child: Text(
                                    translate('update'),
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
