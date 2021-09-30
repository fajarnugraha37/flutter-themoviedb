import 'package:flutter_application/components/app-bar-search/app-bar-search.controller.dart';
import 'package:flutter_application/pages/search/search.controller.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
