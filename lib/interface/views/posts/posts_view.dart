import 'package:im_good/interface/shared/ui_helpers.dart';
import 'package:im_good/interface/widgets/text_widget.dart';
import 'package:im_good/models/post.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'posts_view_model.dart';

class PostsView extends StatelessWidget {
  final String username;
  final List<Post> posts;
  const PostsView({Key? key, required this.username, required this.posts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      viewModelBuilder: () => PostsViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: TextWiget.headline2('Посты  $username'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => viewModel.navigateToCommentsView(posts[index]),
            child: Card(
              color: Colors.tealAccent,
              margin: basePadding,
              child: Padding(
                padding: constPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWiget.headline3(posts[index].title),
                    verticalSpaceTiny,
                    TextWiget.body(posts[index].body),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
