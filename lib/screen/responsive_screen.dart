
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:outlook_flutter/model/email.model.dart';
import 'package:outlook_flutter/widget/email/email_panel.dart';
import 'package:outlook_flutter/widget/inbox/inbox_panel.dart';
import 'package:outlook_flutter/widget/navigation/navigation_panel.dart';
import 'package:outlook_flutter/widget/responsive.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
          mobile: const InboxPanel(),
          tablet: Row(
            children: [
              const Expanded(
                flex: 5,
                  child: InboxPanel()
              ),
              Expanded(
                  flex: 8,
                  child: EmailPanel()
              )
            ],
          ),
          desktop: Row(
            children: [
              Expanded(
                flex: size.width > 1340 ? 2 : 4,
                child: const NavigationPanel(),
              ),
              Expanded(
                flex: size.width > 1340 ? 3 : 5,
                child: const InboxPanel(),
              ),
              Expanded(
                flex: size.width > 1340 ? 8 : 10,
                child: EmailPanel()
              ),
            ],
          ),
      ),
    );
  }

}