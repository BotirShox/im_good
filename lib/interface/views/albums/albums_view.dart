import 'package:im_good/interface/shared/ui_helpers.dart';
import 'package:im_good/interface/widgets/text_widget.dart';
import 'package:im_good/models/album.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'albums_view_model.dart';

class AlbumsView extends StatelessWidget {
  final String username;
  final List<Album> albums;
  const AlbumsView({Key? key, required this.username, required this.albums})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumsViewModel>.reactive(
      viewModelBuilder: () => AlbumsViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: TextWiget.headline2('Альбомы  $username'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, index) => Card(
            margin: basePadding,
            child: Padding(
              padding: constPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () =>
                        viewModel.navigateToPhotosView(albums[index].id),
                  ),
                  TextWiget.body(albums[index].title),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
