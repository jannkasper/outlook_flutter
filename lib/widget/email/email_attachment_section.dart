
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:outlook_flutter/constants.dart';
import 'package:outlook_flutter/model/email.model.dart';
import 'package:outlook_flutter/provider/email.provider.dart';
import 'package:outlook_flutter/widget/email/custom_icon_elevated_button.dart';
import 'package:provider/provider.dart';

class EmailAttachmentSection extends StatelessWidget {
  EmailAttachmentSection({key, required this.attachmentUrls}) : super(key: key);
  List<String> attachmentUrls;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "${attachmentUrls.length} attachment${attachmentUrls.length > 1 ? 's' : ''}",
                style: const TextStyle(fontSize: 12),
              ),
              const Spacer(),
              Text(
                "Download All",
                style: Theme.of(context)
                    .textTheme
                    .caption,
              ),
              const SizedBox(width: kDefaultPadding / 4),
              const Icon(Icons.file_download_outlined, color: kGrayColor,)
            ],
          ),
          const Divider(thickness: 1),
          const SizedBox(height: kDefaultPadding / 2),
          MasonryGridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: attachmentUrls.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  attachmentUrls[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}