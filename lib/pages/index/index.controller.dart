import 'package:flutter_application/main.route.dart';
import 'package:flutter_application/models/movie.model.dart';
import 'package:flutter_application/models/person.model.dart';
import 'package:flutter_application/services/movie-db-service.service.dart';
import 'package:get/get.dart';

class IndexController extends GetxController {
  RxBool _isFetching = false.obs;
  MovieDbService movieDbService = MovieDbService();

  bool get isFetching => _isFetching.value;
  set setFetching(bool value) => _isFetching.value = value;

  RxList<Person> _persons = List<Person>.empty(growable: true).obs;
  List<Person> get persons => _persons.value;
  void setPersons(List<Person> value) =>
      _persons.value = [...persons, ...value];

  RxList<Movie> _popularMovies = List<Movie>.empty(growable: true).obs;
  List<Movie> get popularMovies => _popularMovies.value;
  void setPopularMovies(List<Movie> value) =>
      _popularMovies.value = [...popularMovies, ...value];

  RxList<Movie> _nowPlayigMovies = List<Movie>.empty(growable: true).obs;
  List<Movie> get nowPlayigMovies => _nowPlayigMovies.value;
  void setNowPlayigMovies(List<Movie> value) =>
      _nowPlayigMovies.value = [...nowPlayigMovies, ...value];

  RxList<Movie> _comingSoonMovies = List<Movie>.empty(growable: true).obs;
  List<Movie> get comingSoonMovies => _comingSoonMovies.value;
  void setComingSoonMovies(List<Movie> value) =>
      _comingSoonMovies.value = [...comingSoonMovies, ...value];

  List<Movie> getMoviesCategory(String section) {
    switch (section) {
      case MovieDbService.NOW_PLAYING:
        return nowPlayigMovies;
      case MovieDbService.TOP_RATED:
        return comingSoonMovies;
      default:
        return popularMovies;
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    this.setFetching = true;
    setPopularMovies(
      await movieDbService.getMovie(MovieDbService.POPULAR, 1),
    );
    setNowPlayigMovies(
      await movieDbService.getMovie(MovieDbService.NOW_PLAYING, 2),
    );
    setComingSoonMovies(
      await movieDbService.getMovie(MovieDbService.TOP_RATED, 1),
    );
    setPersons(await movieDbService.getPerson(1));
    setFetching = false;
  }

  onPersonClicked(int index, Person item) {
    Get.toNamed(
      MainRoute.SEARCH_RESULT,
      arguments: item,
    );
  }

  onMovieClicked(int index, Movie item) {
    Get.toNamed(
      MainRoute.MOVIE_DETAIL,
      arguments: item,
    );
  }
}
