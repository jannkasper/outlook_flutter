
import 'package:flutter/material.dart';
import 'package:outlook_flutter/constants.dart';

class NavigationTagSection extends StatelessWidget {
  const NavigationTagSection({key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          title: Transform.translate(
              offset: Offset(-20, 0),
              child: Row(
                children: const [
                  Icon(Icons.bookmark_border),
                  SizedBox(width: kDefaultPadding/2),
                  Text('Tags'),
                ],
              )
          ),
          textColor: kGrayColor,
          iconColor: kGrayColor,
          collapsedTextColor: kGrayColor,
          collapsedIconColor: kGrayColor,
          initiallyExpanded: true,
          controlAffinity: ListTileControlAffinity.leading,
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 26,
              color: kGrayColor,
            ),
          ),
          children: const [
            ListTile(
              horizontalTitleGap: 0,
              title: Text('Design'),
              leading: Icon(Icons.bookmark, color: Color(0xFF23CF91)),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: Text('Work'),
              leading: Icon(Icons.bookmark, color: Color(0xFF3A6FF7)),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: Text('Friends'),
              leading: Icon(Icons.bookmark, color: Color(0xFFF3CF50)),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: Text('Family'),
              leading: Icon(Icons.bookmark, color: Color(0xFF8338E1)),
            ),
          ],
        )
    );
  }
}