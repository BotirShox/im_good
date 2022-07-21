import 'package:im_good/locator.dart';
import 'package:im_good/models/post.dart';
import 'package:im_good/routes/route_names.dart';
import 'package:im_good/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class PostsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future navigateToCommentsView(Post post) async {
    await _navigationService.navigateTo(
      commentsViewRoute,
      arguments: post,
    );
  }
}
