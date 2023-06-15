import 'dart:io';

import 'package:dallah/model/branches.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' as map;
import '../index.dart';

// ignore: must_be_immutable
class ShapeBranches extends StatelessWidget {
  Branch element;

  ShapeBranches(this.element);

  Widget div = Divider(height: 1, color: AppColors.secondaryColor, endIndent: 15, indent: 15);
  TextStyle leadStyle = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    color: const Color(0xff111111),
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    var lang = localizationDelegate.currentLocale.languageCode;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        color: const Color(0xffd95620),
        border: Border.all(width: 1.0, color: const Color(0xffd8d8d8)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(6),
                child: SvgPicture.asset(
                  'assets/icons/svg/map-pin-marked.svg',
                  color: AppColors.primaryColor,
                  height: 25,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/ 1.2,
                child: Text(
                  lang == 'ar' ? element.titleAr : element.title,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(2),
              child: Column(
                children: [
                  ListTile(
                      leading: Text(translate('country'), style: leadStyle),
                      dense: true,
                      trailing: Text(lang == 'ar' ? element.addressAr : element.address, style: leadStyle)),
                  div,
                  ListTile(
                      leading: Text(translate('phone'), style: leadStyle),
                      dense: true,
                      trailing: Text(' ${element.phone}', style: leadStyle)),
                  div,
                  TextButton(
                      onPressed: () async {
                        if (Platform.isIOS) {
                          await map.MapLauncher.showMarker(
                            mapType: map.MapType.apple,
                            coords: map.Coords(element.lat, element.lng),
                            title: lang == 'ar' ? element.titleAr : element.title,
                            description: lang == 'ar' ? element.addressAr : element.address,
                          );
                        } else {
                          await map.MapLauncher.showMarker(
                            mapType: map.MapType.google,
                            coords: map.Coords(element.lat, element.lng),
                            title: lang == 'ar' ? element.titleAr : element.title,
                            description: lang == 'ar' ? element.addressAr : element.address,
                          );
                        }
                      },
                      style: TextButton.styleFrom(backgroundColor: AppColors.secondaryColor),
                      child: Text(
                        translate('go_to_school'),
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 12,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
