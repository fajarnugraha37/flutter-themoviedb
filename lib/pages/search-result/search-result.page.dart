import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/components/item-search/item-search.component.dart';
import 'package:flutter_application/pages/search-result/search-result.controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application/utils/extension.dart';

class SearchResultPage extends GetView<SearchResultController> {
  get loadingComponent => Visibility(
        visible: controller.isFetching,
        child: Center(
          heightFactor: 1,
          widthFactor: 1,
          child: SizedBox(
            height: 25.scale,
            width: 25.scale,
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
          itemCount: controller.movies.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180.scale,
            childAspectRatio: 1 / 1.75,
            crossAxisSpacing: 16.scale,
            mainAxisSpacing: 16.scale,
          ),
          itemBuilder: (_, i) => ItemSearchComponent<SearchResultController>(
            item: controller.movies[i],
            index: i,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    List<Widget> rendered = [
      Obx(() {
        if (controller.isFetching && controller.movies.length < 1) {
          return loadingComponent;
        } else {
          if (controller.movies.length < 1) {
            return Center(
              child: Text("Zero Search Result"),
            );
          }
          return gridComponent;
        }
      }),
      Obx(() {
        if (controller.isFetching && controller.movies.length > 0) {
          return Container(
            child: loadingComponent,
            height: 75.scale,
            width: 75.scale,
          );
        } else {
          return SizedBox(
            height: 32.scale,
          );
        }
      })
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
          title: Text(controller.search),
        ),
        body: ListView.builder(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: rendered.length,
          itemBuilder: (_, index) => rendered[index],
        ),
      ),
    );
  }
}
