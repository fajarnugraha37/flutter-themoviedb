import 'package:flutter_application/components/app-bar-search/app-bar-search.controller.dart';
import 'package:flutter_application/components/item-genre/item-genre.controller.dart';
import 'package:flutter_application/main.route.dart';
import 'package:flutter_application/models/genre.model.dart';
import 'package:flutter_application/services/movie-db-service.service.dart';
import 'package:get/get.dart';

class SearchController extends AppBarSearchController with ItemGenreController {
  RxBool _isFetching = false.obs;
  MovieDbService movieDbService = MovieDbService();
  RxList<Genre> _genres = List<Genre>.empty(growable: true).obs;

  bool get isFetching => _isFetching.value;

  set setFetching(bool value) => _isFetching.value = value;

  List<Genre> get genres => _genres.value;

  void setGenres(List<Genre> value) => _genres.value = [...genres, ...value];

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    this.setFetching = true;
    List<Genre> temp = await movieDbService.getGenre();
    setGenres(temp);
    setFetching = false;
  }

  @override
  void onClose() {
    print("SearchController on close");
    super.onClose();
  }

  @override
  void attemptSearch() {
    Get.toNamed(
      MainRoute.SEARCH_RESULT,
      arguments: value,
    );
  }

  @override
  void onClick(int index, Genre item) {
    Get.toNamed(
      MainRoute.SEARCH_RESULT,
      arguments: item,
    );
  }
}
