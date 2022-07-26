import 'package:im_good/locator.dart';
import 'package:im_good/models/user.dart';
import 'package:im_good/routes/route_names.dart';
import 'package:im_good/services/api_service.dart';
import 'package:im_good/services/database_service.dart';
import 'package:im_good/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class UsersViewModel extends FutureViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  final _users = <User>[];
  List<User> get users => _users;

  Future<void> _getUsers() async {
    setBusy(true);
    // Query from db first to check if they are written already
    List<User> usersFromDb = await _databaseService.queryUsers();

    if (usersFromDb.isNotEmpty) {
      _users.addAll(usersFromDb);
    } else {
      List<User> usersFromApi = await _apiService.getUsers();
      for (var user in usersFromApi) {
        await _databaseService.insertUser(user);
      }
      _users.addAll(usersFromApi);
    }
    setBusy(false);
  }

  Future navigateToUserView(int index) async {
    await _navigationService.navigateTo(
      userViewRoute,
      arguments: _users[index],
    );
  }

  @override
  Future futureToRun() => _getUsers();
}
