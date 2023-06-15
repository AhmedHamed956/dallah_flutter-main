import 'package:flutter/material.dart';
import '../index.dart';

class ShapeListTile extends StatelessWidget {
  Widget img;
  Widget title;

  ShapeListTile({this.img, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(9.0),
              bottomLeft: Radius.circular(9.0),
            ),
            color: Colors.white,
            border: Border.all(width: 1.0, color: const Color(0xffb4b4b4)),
          ),
          child: Row(
            children: <Widget>[
              if(img != null)
                Container(color: AppColors.primaryColor, width: 60, height: 60, padding: EdgeInsets.all(10), child: img),
              SizedBox(width: 10),
              Expanded(child: title),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
