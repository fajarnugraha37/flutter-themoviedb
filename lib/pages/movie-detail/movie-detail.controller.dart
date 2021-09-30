import 'package:flutter_application/models/movie.model.dart';
import 'package:flutter_application/services/movie-db-service.service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  MovieDbService movieDbService = MovieDbService();

  Map<String, dynamic> _detailMovie = <String, dynamic>{};
  Map<String, dynamic> get detailMovie => _detailMovie;
  void setDetailMovie(Map<String, dynamic> value) {
    _detailMovie = value;
  }

  RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;
  set setFetching(bool value) => _isFetching.value = value;

  @override
  void onInit() {
    if (Get.arguments is Movie) {
      Movie movie = Get.arguments;
      fetching(movie.id);
    } else {
      Get.snackbar(
        "Error",
        "invalid movie",
      );
      Get.back();
    }
    super.onInit();
  }

  void fetching(int idMovie) async {
    this.setFetching = true;
    Map<String, dynamic> temp = await movieDbService.getDetailMovie(idMovie);
    setDetailMovie(temp);
    setFetching = false;
  }
}
