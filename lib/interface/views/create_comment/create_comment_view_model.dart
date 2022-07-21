import 'package:fluttertoast/fluttertoast.dart';
import 'package:im_good/locator.dart';
import 'package:im_good/models/comment.dart';
import 'package:im_good/services/api_service.dart';
import 'package:im_good/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class CreateCommentViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  Future<void> postComment(Comment comment) async {
    setBusy(true);
    await _apiService.postComment(comment);
    Fluttertoast.showToast(msg: "Опубликовано");
    _navigateBack();
    setBusy(false);
  }

  void _navigateBack() {
    _navigationService.pop();
  }
}
