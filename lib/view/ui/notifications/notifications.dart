import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dallah/core/constants/colors.dart';
import 'package:dallah/view/index.dart';

class Notifications extends StatelessWidget {
  Widget _space = SizedBox(height: 5);
  Widget _spaceW = SizedBox(width: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate('notifications'),
          style: TextStyle(
            fontFamily: 'beIN Normal',
            fontSize: 14,
            color: const Color(0xff646363),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // decoration: BoxDecoration(
              //   color: const Color(0xffffffff),
              //   border: Border.all(width: 0.1, color: const Color(0x73707070)),
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      translate('last_notifications'),
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16,
                        color: const Color(0xff595959),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                        child: Row(
                          children: [
                            Text(
                              translate('add'),
                              style: TextStyle(
                                fontFamily: 'beIN Normal',
                                fontSize: 14,
                                color: AppColors.greenColor,
                              ),
                            ),
                            _spaceW,
                            Icon(
                              Icons.add,
                              color: AppColors.greenColor,
                              size: 18,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: Size(100, 38),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey[400]), borderRadius: BorderRadius.all(Radius.circular(5))),
                            elevation: 0),
                        onPressed: () => _showMyDialog(context)),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersDetails())),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        border: Border.all(width: 0.1, color: const Color(0xff707070)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x0a000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.userAlt,
                                              size: 15,
                                              color: AppColors.primaryColor,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'أحمد عمر علي',
                                              style: TextStyle(
                                                fontFamily: 'beIN Normal',
                                                fontSize: 13,
                                                color: const Color(0xff134e5e),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text.rich(
                                        TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'beIN Normal',
                                            fontSize: 14,
                                            color: const Color(0xff646363),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'أضاف عرض جديد ,',
                                            ),
                                            TextSpan(
                                              text: 'مشاهدة',
                                              style: TextStyle(
                                                color: const Color(0xff68a97c),
                                              ),
                                            ),
                                          ],
                                        ),
                                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '22-07-2021',
                                        style: TextStyle(
                                          fontFamily: 'beIN Normal',
                                          fontSize: 10,
                                          color: const Color(0xb86b6b6b),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                        ],
                      )),
                ),
                itemCount: 20,
              ))
        ],
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            translate('add_notification'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 14,
              color: const Color(0xff171717),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: translate('enter_message'),
                        hintStyle: TextStyle(fontSize: 15),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 18),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(translate('cancel')),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 30),
                  elevation: 0,
                  primary: AppColors.darkGreyColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: EdgeInsets.all(0)),
            ),
            _spaceW,
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(translate('save')),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 30),
                  elevation: 0,
                  primary: AppColors.greenColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: EdgeInsets.all(0)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _delete(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            translate('are_u_sure'),
            style: TextStyle(
              fontFamily: 'beIN',
              fontSize: 20,
              color: const Color(0xff134e5e),
              fontWeight: FontWeight.w900,
            ),
          ),
          content: Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'beIN Normal',
                fontSize: 14,
                color: const Color(0xff6b6b6b),
              ),
              children: [
                TextSpan(
                  text: translate('delete') + ' ',
                ),
                TextSpan(
                  text: ', أحمد عمر علي  ',
                  style: TextStyle(
                    color: const Color(0xffd10606),
                  ),
                ),
              ],
            ),
            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(translate('cancel')),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 30),
                  elevation: 0,
                  primary: AppColors.darkGreyColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: EdgeInsets.all(0)),
            ),
            _spaceW,
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(translate('delete')),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 30),
                  elevation: 0,
                  primary: AppColors.redColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: EdgeInsets.all(0)),
            ),
          ],
        );
      },
    );
  }
}
