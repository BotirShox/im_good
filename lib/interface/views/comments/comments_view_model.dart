import 'package:im_good/locator.dart';
import 'package:im_good/models/comment.dart';
import 'package:im_good/routes/route_names.dart';
import 'package:im_good/services/api_service.dart';
import 'package:im_good/services/database_service.dart';
import 'package:im_good/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class CommentsViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  final _postComments = <Comment>[];
  List<Comment> get postComments => _postComments;

  void getPostComments(int postId) async {
    setBusy(true);
    List<Comment> commentsFromDb = await _databaseService.queryComments(postId);
    if (commentsFromDb.isNotEmpty) {
      _postComments.addAll(commentsFromDb);
    } else {
      List<Comment> commentsFromApi = await _apiService.getPostComments(postId);
      for (var comment in commentsFromApi) {
        await _databaseService.insertComment(comment);
      }
      _postComments.addAll(commentsFromApi);
    }
    setBusy(false);
  }

  Future navigateToCreateCommentView(int postId) async {
    await _navigationService.navigateTo(
      createCommentViewRoute,
      arguments: postId,
    );
  }
}
