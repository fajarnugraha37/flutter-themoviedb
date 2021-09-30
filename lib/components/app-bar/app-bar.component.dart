import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application/utils/extension.dart';

// ignore: must_be_immutable
class AppBarComponent extends GetWidget implements PreferredSizeWidget {
  Widget? leading, title;
  List<Widget>? actions;

  AppBarComponent({this.leading, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: false,
      leading: this.leading,
      leadingWidth: 30.scale,
      title: this.title,
      actions: this.actions,
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
