
import 'package:flutter/widgets.dart';

class Responsive extends StatelessWidget {
  const Responsive({ key, required this.mobile, required this.tablet, required this.desktop }) : super(key: key);
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrains) {
          if (constrains.maxWidth >= 1100) {
            return desktop;
          } else if (constrains.maxWidth >= 650) {
            return tablet;
          } else {
            return  mobile;
          }
        }
    );
  }
}