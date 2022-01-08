import 'package:flutter/material.dart';
import '../constants.dart';


class CardChild extends StatelessWidget {
  CardChild({this.ObjectIcon,this.TitleText});

  final IconData ObjectIcon;
  final String TitleText;


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ObjectIcon,
          size: 50.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          TitleText,
          style: kLabelTextStyles,
        )
      ],
    );
  }
}
