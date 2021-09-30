import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/app-bar-search/app-bar-search.controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application/utils/extension.dart';

/// untuk mengimplementasi AppBarSearch Wajib extends Controllernya
class AppBarSearchComponent<T extends AppBarSearchController>
    extends GetWidget<T> implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          size: 24.scale,
        ),
      ),
      leadingWidth: 32.scale,
      title: Row(
        children: [
          Flexible(
            child: TextField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.bottom,
              style: TextStyle(
                fontSize: 12.scale,
              ),
              onSubmitted: (value) => controller.attemptSearch(),
              controller: controller.textController,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.scale,
                  vertical: 8.scale,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Get.theme.primaryColor,
                    width: 2.scale,
                  ),
                  borderRadius: BorderRadius.circular(5.scale),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Get.theme.accentColor,
                    width: 2.scale,
                  ),
                  borderRadius: BorderRadius.circular(5.scale),
                ),
                hintText: 'Tell us about your favorite film',
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isFilled,
              child: GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.scale),
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 24.scale,
                  ),
                ),
                onTap: controller.clearSearch,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0.scale);
}
