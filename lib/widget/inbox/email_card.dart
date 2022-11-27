
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:outlook_flutter/constants.dart';
import 'package:outlook_flutter/date_extension.dart';
import 'package:outlook_flutter/model/email.model.dart';
import 'package:outlook_flutter/widget/extension.dart';

class EmailCard extends StatelessWidget {
  const EmailCard({
    key,
    required this.email,
    required this.isActive, 
    required this.onPress
  }) : super(key: key);
  
  final EmailModel email;
  final bool isActive;
  final VoidCallback onPress;
  
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isActive ? kPrimaryColor : kBgDarkColor;
    Color textColor = isActive ? Colors.white : kTextColor;
    Color bodyColor = isActive ? kBgDarkColor : Colors.black;

    return GestureDetector(
      onTap: onPress,
      child: Transform.scale(
        scale: isActive ? 1.05 : 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical:  kDefaultPadding/8),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                            height: 32,
                            width: 32,
                            child: ClipOval(
                              child: Image.network(email.image),
                            ),
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding/2),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  email.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: textColor,
                                  ),
                                ),
                                Text(
                                  email.subject,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: textColor
                                  ),
                                ),
                              ],
                            )
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                DateFormat(email.time.isToday() ? "Hm" : "dd-MM-yyyy").format(email.time),
                                style: Theme.of(context).textTheme.caption?.merge(TextStyle(color: textColor))
                            ),
                            if (email.attachments.isNotEmpty)
                              const Icon(Icons.attachment, color: kGrayColor, size: 20)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding / 2),
                    Text(
                      email.body.replaceAll('\n', ' '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption?.merge(TextStyle(
                          color: bodyColor,
                          height: 1.5
                      )),
                    ),
                  ],
                ),
              ).addNeumorphism(),
              if (!email.isChecked)
                Positioned(
                  right: 10,
                  top: 8,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kBadgeColor,
                    ),
                  ),
                ),
              if (email.tagColor != null)
                Positioned(
                  left: 8,
                  top: 0,
                  child: Icon(
                      Icons.bookmark,
                      color:  email.tagColor,
                      size: 22
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}