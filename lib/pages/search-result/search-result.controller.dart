import 'package:flutter/material.dart';
import 'package:flutter_application/components/item-search/item-search.controller.dart';
import 'package:flutter_application/main.route.dart';
import 'package:flutter_application/models/genre.model.dart';
import 'package:flutter_application/models/movie.model.dart';
import 'package:flutter_application/models/person.model.dart';
import 'package:flutter_application/services/movie-db-service.service.dart';
import 'package:get/get.dart';

class SearchResultController extends GetxController with ItemSearchController {
  MovieDbService movieDbService = MovieDbService();

  String _search = "";
  String get search => _search;
  set setSearch(String value) => _search = value;

  RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;
  set setFetching(bool value) => _isFetching.value = value;

  int _page = 1;
  int get page => _page;
  set setPage(int value) => _page = value;

  RxList<Movie> _movies = List<Movie>.empty(growable: true).obs;
  List<Movie> get movies => _movies.value;
  void setMovies(List<Movie> value) => _movies.value = [...movies, ...value];

  ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  @override
  void onInit() {
    if (Get.arguments is String) {
      setSearch = Get.arguments;
      initSearch(Get.arguments);
    } else if (Get.arguments is Genre) {
      Genre genre = Get.arguments;
      setSearch = genre.name;
      initSearch(genre.name);
    } else if (Get.arguments is Person) {
      Person person = Get.arguments;
      setSearch = "Starring by " + person.name;
      initPerson(person.id);
    } else {
      Get.snackbar(
        "Error",
        "invalid movie",
      );
      Get.back();
    }
    super.onInit();
  }

  void initSearch(String querySearch) async {
    this.setFetching = true;
    List<Movie> temp = await movieDbService.searchMovie(querySearch, page);
    setMovies(temp);
    setFetching = false;

    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        nextSearchPage(querySearch);
      }
      if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        // top
      }
    });
  }

  void nextSearchPage(String querySearch) async {
    this.setFetching = true;
    List<Movie> temp =
        await movieDbService.searchMovie(querySearch, (page + 1));
    if (temp.length > 0) {
      setPage = page + 1;
      setMovies(temp);
    } else {
      Get.snackbar("Caution", "You are reaching the end of page");
    }
    setFetching = false;
  }

  void initPerson(int idPerson) async {
    this.setFetching = true;
    List<Movie> temp = await movieDbService.getMovieByPerson(idPerson);
    setMovies(temp);
    setFetching = false;
  }

  @override
  void onClick(int index, Movie item) {
    Get.toNamed(
      MainRoute.MOVIE_DETAIL,
      arguments: item,
    );
    super.onClick(index, item);
  }
}
