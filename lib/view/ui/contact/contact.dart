import 'package:dallah/core/config/validators.dart';
import 'package:dallah/viewModel/contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:dallah/core/constants/colors.dart';
import 'package:dallah/view/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:stacked/stacked.dart';

class ContactUs extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('courses_dallah'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: ViewModelBuilder<ContactUsViewModel>.reactive(
            viewModelBuilder: () => ContactUsViewModel(),
            disposeViewModel: false,
            builder: (context, model, child) {
            return SingleChildScrollView(
              child:  Form(
                key: model.form,
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png', width: 200),
                    ShapeListTile(
                      img: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset('assets/icons/svg/user.svg', color: Colors.white),
                      ),
                      title: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) => Validators.validateName(value),
                        onChanged: (value) => model.name = value,
                        decoration: InputDecoration(
                          hintText: translate('full_name'),
                          border: InputBorder.none
                        ),
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          color: const Color(0xff111111),
                          fontWeight: FontWeight.w700,
                        ),

                      )
                    ),
                    Dimens.spaceH,
                    ShapeListTile(
                        img: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset('assets/icons/svg/mail.svg', color: Colors.white),
                        ),
                        title: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => Validators.validateEmail(value),
                          onChanged: (value) => model.email = value,
                          decoration: InputDecoration(
                              hintText: translate('email'),
                              border: InputBorder.none
                          ),
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13,
                            color: const Color(0xff111111),
                            fontWeight: FontWeight.w700,
                          ),

                        )
                    ),
                    Dimens.spaceH,
                    ShapeListTile(
                        img: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset('assets/icons/svg/smartphone-call.svg', color: Colors.white),
                        ),
                        title: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (value) => Validators.validatePhone(value),
                          onChanged: (value) => model.phone = value,
                          decoration: InputDecoration(
                              hintText: translate('phone'),
                              border: InputBorder.none
                          ),
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13,
                            color: const Color(0xff111111),
                            fontWeight: FontWeight.w700,
                          ),

                        )
                    ),
                    Dimens.spaceH,
                    ShapeListTile(
                        img: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset('assets/icons/svg/comment.svg', color: Colors.white),
                        ),
                        title: TextFormField(
                          keyboardType: TextInputType.multiline,
                          validator: (value) => Validators.validateForm(value),
                          onChanged: (value) => model.message = value,
                          decoration: InputDecoration(
                              hintText: translate('message'),
                              border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13,
                            color: const Color(0xff111111),
                            fontWeight: FontWeight.w700,
                          ),

                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                                onPressed: () => model.sendContactUs(context),
                                style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
                                child: Text(
                                 translate('send'),
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
                    SizedBox(
                      height: 200,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ));
  }
}
