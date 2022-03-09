import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';
import '../../../services/_services.dart';

class HomeViewmodel extends BaseViewModel {
  final _navigationService = locator<INavigationService>();
  Future<List<FilmInfo>> fetchFilms() async {
    try {
      return [];
    } on Failure catch (e) {
      throw "";
    }
  }

  void navigateToProfile() {
    _navigationService.back();
    _navigationService.toNamed(Routes.profileRoute);
  }
}
