import 'package:im_good/interface/shared/ui_helpers.dart';
import 'package:im_good/interface/widgets/text_widget.dart';
import 'package:im_good/models/post.dart';
import 'package:flutter/material.dart';

class UserPostsWidget extends StatelessWidget {
  final List<Post> posts;
  const UserPostsWidget({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyanAccent,
      margin: basePadding,
      child: Container(
        padding: constPadding,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextWiget.headline3('Посты'),
            verticalSpaceSmall,
            ...<Widget>[
              ...posts.take(3).map(
                    (p) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWiget.body("- " + p.title),
                        verticalSpaceTiny,
                      ],
                    ),
                  )
            ]
          ],
        ),
      ),
    );
  }
}
