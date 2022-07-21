import 'package:im_good/locator.dart';
import 'package:im_good/routes/route_names.dart';
import 'package:im_good/services/database_service.dart';
import 'package:im_good/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  Future initialise() async {
    await _databaseService.initialiseDb();
    await _navigationService.navigateReplaceTo(usersViewRoute);
  }
}
