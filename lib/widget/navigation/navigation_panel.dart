
import 'package:flutter/material.dart';
import 'package:outlook_flutter/constants.dart';
import 'package:outlook_flutter/widget/navigation/custom_icon_button.dart';
import 'package:outlook_flutter/widget/navigation/navigation_tag_section.dart';
import 'package:outlook_flutter/widget/navigation/navigation_tiles_section.dart';
import 'package:outlook_flutter/widget/responsive.dart';

class NavigationPanel extends StatefulWidget {
  const NavigationPanel({key}) : super(key: key);

  @override
  _NavigationPanelState createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgLightColor,
      alignment: Alignment.topCenter,
      child: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/outlook_logo.png",
                        width: 46,
                      ),
                      if (!Responsive.isDesktop(context))
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close)
                        ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding),
                  CustomIconButton(
                    text: 'New message',
                    iconData: Icons.drive_file_rename_outline,
                    backgroundColor: kPrimaryColor,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  CustomIconButton(
                    text: 'Get messages',
                    iconData: Icons.file_download_outlined,
                    backgroundColor: kBgLightColor,
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 32),
                  const NavigationTilesSection(),
                  const SizedBox(height: 16),
                  const NavigationTagSection()
                ],
              )
          )
      ),
    );
  }
}