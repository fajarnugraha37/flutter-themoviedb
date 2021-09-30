import 'package:flutter/cupertino.dart';
import 'package:flutter_application/components/app-bar/app-bar.component.dart';
import 'package:flutter_application/components/image-card.component.dart';
import 'package:flutter_application/components/image-circular.component.dart';
import 'package:flutter_application/main.route.dart';
import 'package:flutter_application/pages/index/index.controller.dart';
import 'package:flutter_application/services/movie-db-service.service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/utils/extension.dart';

class IndexPage extends GetView<IndexController> {
  Widget getAppBar(BuildContext _) => AppBarComponent(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed(MainRoute.SEARCH);
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          // Builder(
          //   builder: (context) => // Ensure Scaffold is in context
          //       IconButton(
          //           icon: Icon(CupertinoIcons.bars),
          //           onPressed: () => Scaffold.of(context).openEndDrawer()),
          // ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      // endDrawer: Container(
      //   padding: EdgeInsets.symmetric(
      //     vertical: 8.scale,
      //   ),
      //   width: Get.size.width / 5 * 3,
      //   color: Get.theme.primaryColor,
      //   child: DrawerComponent(),
      // ),
      body: ListView(
        children: [
          getAppBar(context),
          HeaderSection(),
          PopularPersonSection(),
          MovieSection(
            section: MovieDbService.NOW_PLAYING,
            title: "Now Playing",
          ),
          MovieSection(
            section: MovieDbService.TOP_RATED,
            title: "Top Rated",
          ),
          SizedBox(
            height: 21.scale,
          )
        ],
      ),
    );
  }
}

class HeaderSection extends GetWidget<IndexController> {
  final IndexController indexController = Get.put(IndexController());

  HeaderSection({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 32.scale,
            bottom: 16.scale,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's On",
                style: TextStyle(
                  fontSize: 32.scale,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Popular Today"),
            ],
          ),
        ),
        Obx(() => loadingComponent),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Get.size.width / 4 * 3,
          ),
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.popularMovies.length,
              itemBuilder: (_, index) => GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(
                    right: 8.scale,
                    left: 12.scale,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.scale),
                    ),
                    child: Image.network(
                      controller.popularMovies[index].poster,
                    ),
                  ),
                ),
                onTap: () => controller.onMovieClicked(
                  index,
                  controller.popularMovies[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PopularPersonSection extends GetWidget<IndexController> {
  final IndexController indexController = Get.put(IndexController());

  PopularPersonSection({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 32.scale,
            left: 32.scale,
            right: 8.scale,
            bottom: 16.scale,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Person",
                style: TextStyle(
                  fontSize: 18.scale,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Obx(() => loadingComponent),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 80.scale,
          ),
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.persons.length,
              itemBuilder: (_, index) => GestureDetector(
                child: ImageCircular(
                  imgUri: controller.persons[index].path,
                  marginLeft: 8.scale,
                  marginRight: 12.scale,
                ),
                onTap: () => controller.onPersonClicked(
                  index,
                  controller.persons[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MovieSection extends GetWidget<IndexController> {
  final String section, title;
  final IndexController indexController = Get.put(IndexController());

  MovieSection({
    Key? key,
    required this.title,
    required this.section,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 24.scale,
            left: 32.scale,
            right: 8.scale,
            bottom: 16.scale,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.scale,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Obx(() => loadingComponent),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 160.scale,
          ),
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.getMoviesCategory(section).length,
              itemBuilder: (_, index) => GestureDetector(
                child: ImageCardCompoent(
                  imgUri: controller.getMoviesCategory(section)[index].poster,
                  marginLeft: 8.scale,
                  marginRight: 12.scale,
                ),
                onTap: () => controller.onMovieClicked(
                  index,
                  controller.getMoviesCategory(section)[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
