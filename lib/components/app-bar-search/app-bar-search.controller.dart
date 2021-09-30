import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppBarSearchController extends GetxController {
  TextEditingController textController = TextEditingController();

  String _value = "";

  RxBool _isFilled = false.obs;

  String get value => _value;

  set setValue(String value) => _value = value;

  bool get isFilled => _isFilled.value;

  set setIsFilled(bool value) => _isFilled.value = value;

  @override
  void onInit() {
    textController.addListener(() {
      _value = textController.text;
      setIsFilled = _value.length > 0;
    });
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  clearSearch() {
    textController.clear();
  }

  void attemptSearch();
}
