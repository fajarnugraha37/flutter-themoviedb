import 'package:flutter_application/models/genre.model.dart';
import 'package:flutter_application/models/movie.model.dart';
import 'package:get/get.dart';

/// tapi ingat kalau mixin jangan pernah override lifecycle di GetLifeCycleBase
mixin ItemSearchController implements GetLifeCycleBase {
  void onClick(int index, Movie item) {}
}
