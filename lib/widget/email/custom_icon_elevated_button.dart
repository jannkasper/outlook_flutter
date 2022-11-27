

import 'package:flutter/material.dart';
import 'package:outlook_flutter/constants.dart';

class CustomIconElevatedButton extends StatelessWidget {
  CustomIconElevatedButton({key, required this.iconData}) : super(key: key);
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        constraints: const BoxConstraints(minWidth: 40),
        icon: Icon(iconData, color: kGrayColor)
    );
    // return ElevatedButton(
    //   style: ElevatedButton.styleFrom(
    //     padding: EdgeInsets.zero,
    //     elevation: 0.0,
    //     shadowColor: Colors.transparent,
    //     backgroundColor: Colors.white,
    //     foregroundColor: Colors.black,
    //     // padding: const EdgeInsets.all(kDefaultPadding),
    //     shape: const CircleBorder()
    //   ),
    //   onPressed: () { },
    //   child: Icon(iconData, color: kGrayColor),
    // );
  }
}