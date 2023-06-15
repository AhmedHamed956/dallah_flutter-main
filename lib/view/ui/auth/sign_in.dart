import 'package:dallah/core/config/locator.dart';
import 'package:dallah/core/config/validators.dart';
import 'package:dallah/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:dallah/core/constants/colors.dart';
import 'package:dallah/view/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:stacked/stacked.dart';

class SignIn extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  bool isBack = false;

  SignIn(this.isBack);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('login'),
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
            builder: (context, model, child) {
            return SingleChildScrollView(
              child: Form(
                key: model.form,
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png', width: 200),
                    ShapeListTile(
                        img: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset('assets/icons/svg/id-icon.svg', color: Colors.white),
                        ),
                        title: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) => Validators.validateForm(value),
                          onChanged: (value) => model.idNumber = value,
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
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset('assets/icons/svg/lock.svg', color: Colors.white),
                        ),
                        title: TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (value) => Validators.validateForm(value),
                          onChanged: (value) => model.password = value,
                          obscureText: true,
                          decoration: InputDecoration(hintText: translate('password'), border: InputBorder.none),
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13,
                            color: const Color(0xff111111),
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    // Padding(
                    //   padding: const EdgeInsets.all(15.0),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         'نسيت كلمة المرور ؟',
                    //         style: TextStyle(
                    //           fontFamily: 'Cairo',
                    //           fontSize: 13,
                    //           color: const Color(0xff111111),
                    //           fontWeight: FontWeight.w700,
                    //           height: 1.2307692307692308,
                    //         ),
                    //         textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    //         textAlign: TextAlign.start,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                                onPressed: () => model.signInButton(context,isBack),
                                style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
                                child: Text(
                                  translate('login'),
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
          }
        ));
  }
}
