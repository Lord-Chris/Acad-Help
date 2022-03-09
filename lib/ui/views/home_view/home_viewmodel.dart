import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';

class HomeViewmodel extends BaseViewModel {
  Future<List<FilmInfo>> fetchFilms() async {
    try {
      return [];
    } on Failure catch (e) {
      throw "";
    }
  }
}
