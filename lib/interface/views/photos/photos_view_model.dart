import 'package:im_good/locator.dart';
import 'package:im_good/models/photo.dart';
import 'package:im_good/services/api_service.dart';
import 'package:im_good/services/database_service.dart';
import 'package:stacked/stacked.dart';

class PhotosViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _databaseService = locator<DatabaseService>();

  bool? showSlideShow;

  void initSlideshow(bool slide) {
    showSlideShow = slide;
  }

  final _albumPhotos = <Photo>[];
  List<Photo> get albumPhotos => _albumPhotos;

  Future<void> getAlbumPhotos(int albumId) async {
    setBusy(true);
    List<Photo> photosFromDb = await _databaseService.queryPhotos(albumId);
    if (photosFromDb.isNotEmpty) {
      _albumPhotos.addAll(photosFromDb);
    } else {
      List<Photo> photosFromApi = await _apiService.getAlbumPhotos(albumId);
      for (var photo in photosFromApi) {
        await _databaseService.insertPhoto(photo);
      }
      _albumPhotos.addAll(photosFromApi);
    }
    setBusy(false);
  }
}
