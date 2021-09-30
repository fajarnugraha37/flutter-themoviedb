import 'package:flutter_application/pages/search-result/search-result.controller.dart';
import 'package:get/get.dart';

class SearchResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchResultController>(
      () => SearchResultController(),
    );
  }
}
