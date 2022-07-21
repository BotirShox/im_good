import 'package:im_good/interface/shared/ui_helpers.dart';
import 'package:im_good/interface/widgets/carousel_images_widget.dart';
import 'package:im_good/interface/widgets/image_widget.dart';
import 'package:im_good/interface/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'photos_view_model.dart';

class PhotoLarge extends StatelessWidget {
  final int albumId;
  final bool slideshow;
  const PhotoLarge({
    Key? key,
    required this.albumId,
    required this.slideshow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotosViewModel>.reactive(
      viewModelBuilder: () => PhotosViewModel(),
      onModelReady: (viewModel) async {
        viewModel.initSlideshow(slideshow);
        await viewModel.getAlbumPhotos(albumId);
      },
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: viewModel.showSlideShow! && viewModel.albumPhotos.isNotEmpty
            ? Padding(
          padding: basePadding,
        )
            : GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => GridTile(
            child: ImageWidget(
              imageUrl: viewModel.albumPhotos[index].url,
            ),
            footer: GridTileBar(
              subtitle:
              TextWiget.body(viewModel.albumPhotos[index].title),
            ),
          ),
        ),
      ),
    );
  }
}
