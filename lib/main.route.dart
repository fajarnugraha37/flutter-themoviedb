import 'package:flutter_application/pages/index/index.binding.dart';
import 'package:flutter_application/pages/index/index.page.dart';
import 'package:flutter_application/pages/movie-detail/movie-detail.binding.dart';
import 'package:flutter_application/pages/movie-detail/movie-detail.page.dart';
import 'package:flutter_application/pages/search-result/search-result.binding.dart';
import 'package:flutter_application/pages/search-result/search-result.page.dart';
import 'package:flutter_application/pages/search/search.binding.dart';
import 'package:flutter_application/pages/search/search.page.dart';
import 'package:get/get.dart';

class MainRoute {
  static const INITIAL = '/';
  static const SEARCH = '/search';
  static const SEARCH_RESULT = '/search_result';
  static const MOVIE_DETAIL = '/movie_detail';

  static final pages = [
    GetPage(
      name: INITIAL,
      page: () => IndexPage(),
      binding: IndexBinding(),
    ),
    GetPage(
      name: SEARCH,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: SEARCH_RESULT,
      page: () => SearchResultPage(),
      binding: SearchResultBinding(),
    ),
    GetPage(
      name: MOVIE_DETAIL,
      page: () => MovieDetailPage(),
      binding: MovieDetailBinding(),
    ),
  ];
}
