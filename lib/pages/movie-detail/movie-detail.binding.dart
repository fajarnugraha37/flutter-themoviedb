import 'package:flutter_application/pages/movie-detail/movie-detail.controller.dart';
import 'package:get/get.dart';

class MovieDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailController>(
      () => MovieDetailController(),
    );
  }
}
