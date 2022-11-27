
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:outlook_flutter/constants.dart';
import 'package:outlook_flutter/model/email.model.dart';
import 'package:outlook_flutter/provider/email.provider.dart';
import 'package:outlook_flutter/widget/email/custom_icon_elevated_button.dart';
import 'package:outlook_flutter/widget/email/email_attachment_section.dart';
import 'package:outlook_flutter/widget/responsive.dart';
import 'package:provider/provider.dart';

class EmailPanel extends StatefulWidget {
  EmailPanel({key}) : super(key: key);

  @override
  _EmailPanelState createState() => _EmailPanelState();
}

class _EmailPanelState extends State<EmailPanel> {
  late EmailProvider _emailProvider;

  @override
  Widget build(BuildContext context) {
    _emailProvider = Provider.of<EmailProvider>(context, listen: true);
    EmailModel email = _emailProvider.email;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(kDefaultPadding * 1.5),
            child: Row(
              children: [
                if (Responsive.isMobile(context))
                  const BackButton(),
                CustomIconElevatedButton(iconData: Icons.delete_outlined),
                CustomIconElevatedButton(iconData: Icons.reply_outlined),
                CustomIconElevatedButton(iconData: Icons.reply_all_outlined),
                CustomIconElevatedButton(iconData: Icons.play_arrow_outlined),
                const Spacer(),
                if (Responsive.isDesktop(context))
                  CustomIconElevatedButton(iconData: Icons.print_outlined),
                CustomIconElevatedButton(iconData: Icons.bookmark_outline),
                CustomIconElevatedButton(iconData: Icons.more_horiz),
              ],
            ),
          ),
          const Divider(),
          Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(email.image),
                      ),
                      const SizedBox(width: kDefaultPadding),
                      Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                              text: email.name,
                                              style: Theme.of(context).textTheme.button?.merge(const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16
                                              )),
                                              children: [
                                                TextSpan(
                                                  text: ' <${email.email}> to Jerry Torp',
                                                  style: Theme.of(context).textTheme.caption,
                                                )
                                              ]
                                          ),
                                        ),
                                        const SizedBox(height: kDefaultPadding/2),
                                        Text(
                                          email.subject,
                                          style: Theme.of(context).textTheme.headline5?.merge(const TextStyle(
                                            fontWeight: FontWeight.w700,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: kDefaultPadding / 2),
                                  Text(
                                    DateFormat('dd-MM-yyy,  H:mm:s').format(email.time),
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              const SizedBox(height: kDefaultPadding),
                              Text(
                                email.body,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Color(0xFF4D5875),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding),
                              if (email.attachments.isNotEmpty)
                                EmailAttachmentSection(attachmentUrls: email.attachments)
                            ],
                          )
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}