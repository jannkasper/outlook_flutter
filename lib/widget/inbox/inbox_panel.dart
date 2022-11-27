
import 'package:flutter/material.dart';
import 'package:outlook_flutter/model/email.model.dart';
import 'package:outlook_flutter/provider/email.provider.dart';
import 'package:outlook_flutter/widget/email/email_panel.dart';
import 'package:outlook_flutter/widget/inbox/email_card.dart';
import 'package:outlook_flutter/widget/navigation/navigation_panel.dart';
import 'package:outlook_flutter/widget/responsive.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class InboxPanel extends StatefulWidget {
  const InboxPanel({key}) : super(key: key);

  @override
  _InboxPanelState createState() => _InboxPanelState();
}

class _InboxPanelState extends State<InboxPanel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late EmailProvider _emailProvider;

  void onPressItem(int index) {
    _emailProvider.setEmail(index);
    if (Responsive.isMobile(context)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => EmailPanel()));
    }
  }

  @override
  Widget build(BuildContext context) {
    _emailProvider = Provider.of<EmailProvider>(context, listen: true);
    List<EmailModel> emails = _emailProvider.emails;

    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: const NavigationPanel(),
      ),
      body: Container(
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            icon: const Icon(Icons.menu)
                        ),
                      Expanded(
                          child:TextField(
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                                hintText: 'Search',
                                fillColor: kBgLightColor,
                                filled: true,
                                suffixIcon: Padding(
                                    padding: EdgeInsets.only(right: kDefaultPadding * 0.75),
                                    child: Icon(Icons.search)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none
                                )
                            ),
                          )
                      )
                    ],
                  ),
              ),
              Padding(
                padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding, bottom: kDefaultPadding/2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.expand_more,
                        size: 24,
                      ),
                      label: const Text('Sort by date'),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        primary: Colors.black,
                      ),
                    ),
                    const Icon(Icons.filter_list)
                  ],
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      // padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: kDefaultPadding),
                      itemCount: emails.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EmailCard(
                            email: emails[index],
                            isActive: index == _emailProvider.selectedIndex,
                            onPress: () => onPressItem(index)
                        );
                      }
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}