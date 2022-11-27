
import 'package:flutter/material.dart';
import 'package:outlook_flutter/constants.dart';
import 'package:outlook_flutter/widget/extension.dart';
import 'package:outlook_flutter/widget/navigation/custom_icon_button.dart';
import 'package:outlook_flutter/widget/navigation/navigation_tag_section.dart';

class NavigationTilesSection extends StatefulWidget {
  const NavigationTilesSection({key}) : super(key: key);

  @override
  _NavigationTilesSectionState createState() => _NavigationTilesSectionState();
}

class _NavigationTilesSectionState extends State<NavigationTilesSection> {

  @override
  Widget build(BuildContext context) {
    return  ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: ListTile.divideTiles(
          context: context,
          tiles: [
            const ListTile(
              title: Text('Inbox'),
              leading: Icon(Icons.inbox),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            ),
            const ListTile(
              title: Text('Sent'),
              leading: Icon(Icons.send),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            ),
            const ListTile(
              title: Text('Drafts'),
              leading: Icon(Icons.drafts),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            ),
            const ListTile(
              title: Text('Deleted'),
              leading: Icon(Icons.delete),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),

            ),
          ]
      ).toList(),
    );
  }
}