
import 'package:flutter/material.dart';
import 'package:outlook_flutter/widget/extension.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({key,
    required this.text,
    required this.iconData,
    required this.backgroundColor,
    required this.textColor
  }) : super(key: key);

  String text;
  IconData iconData;
  Color backgroundColor;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
          onPressed: () {},
          icon: Icon(iconData),
          label: Text(text),
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              primary: textColor,
              backgroundColor: backgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )
          )
      ).addNeumorphism(),
    );
  }
}