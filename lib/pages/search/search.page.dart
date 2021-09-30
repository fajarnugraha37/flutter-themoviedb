import 'package:flutter_application/components/app-bar-search/app-bar-search.component.dart';
import 'package:flutter_application/components/item-genre/item-genre.component.dart';
import 'package:flutter_application/pages/search/search.controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/utils/extension.dart';

class SearchPage extends GetView<SearchController> {
  get headerComponent => Container(
        margin: EdgeInsets.only(
          top: 32.scale,
          bottom: 16.scale,
          left: 16.scale,
        ),
        child: GestureDetector(
          child: Text(
            "Genres",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26.scale,
            ),
          ),
          onTap: () {},
        ),
      );

  get loadingComponent => Visibility(
        visible: controller.isFetching,
        child: Center(
          heightFactor: 1,
          widthFactor: 1,
          child: SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
            ),
          ),
        ),
      );

  get gridComponent => Container(
        margin: EdgeInsets.only(
          left: 16.0.scale,
          right: 16.0.scale,
        ),
        child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: controller.genres.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180.scale,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 16.scale,
            mainAxisSpacing: 16.scale,
          ),
          itemBuilder: (_, i) => ItemGenreComponent<SearchController>(
            item: controller.genres[i],
            index: i,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    List<Widget> rendered = [
      headerComponent,
      Obx(() {
        if (controller.isFetching) {
          return loadingComponent;
        } else {
          return gridComponent;
        }
      }),
      SizedBox(height: 32.scale),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBarSearchComponent<SearchController>(),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: rendered.length,
          itemBuilder: (_, index) => rendered[index],
        ),
      ),
    );
  }
}
