import 'package:im_good/locator.dart';
import 'package:im_good/routes/route_names.dart';
import 'package:im_good/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class AlbumsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future navigateToPhotosView(int albumId, {bool slideshow = false}) async {
    await _navigationService.navigateTo(
      photosViewRoute,
      arguments: {
        'albumId': albumId,
        'slideshow': slideshow,
      },
    );
  }
}
