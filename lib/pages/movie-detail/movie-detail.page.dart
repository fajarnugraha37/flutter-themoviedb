import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/pages/movie-detail/movie-detail.controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application/utils/extension.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  MovieDetailController controller = Get.put(MovieDetailController());
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

  get textStyle => TextStyle(
        fontSize: 16.scale,
        fontWeight: FontWeight.bold,
      );

  bool star = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
          title: Text(
            "Detail",
          ),
          actions: [
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(
                  8.scale,
                ),
                child: Icon(
                  star ? Icons.star_rate : Icons.star_outline,
                ),
              ),
              onTap: () {
                setState(() {
                  star = !star;
                  if (star) {
                    Get.snackbar(
                      "Start",
                      "you have star this movie",
                    );
                  }
                });
              },
            )
          ],
        ),
        body: Obx(() {
          if (controller.isFetching) {
            return Center(
              child: loadingComponent,
            );
          } else {
            return ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                Image.network(
                  "https://image.tmdb.org/t/p/w500/${controller.detailMovie["poster_path"]}",
                ),
                Padding(
                  padding: EdgeInsets.all(
                    16.scale,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.scale,
                        ),
                        child: Text(
                          "${controller.detailMovie["original_title"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.scale,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.scale,
                        ),
                        child: Text(
                          "Original Language: ${controller.detailMovie["original_language"]}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.scale,
                        ),
                        child: Text(
                          "Popularity Rate: ${controller.detailMovie["popularity"]}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.scale,
                        ),
                        child: Text(
                          "Vote Average: ${controller.detailMovie["vote_average"]}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.scale,
                        ),
                        child: Text(
                          "Vote Count: ${controller.detailMovie["vote_count"]}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.scale,
                        ),
                        child: Text(
                          "Status: ${controller.detailMovie["status"]}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.scale,
                        ),
                        child: Text(
                          "Tag Line: ${controller.detailMovie["tagline"]}",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.scale,
                        ),
                        child: Text(
                          "Overview: ${controller.detailMovie["overview"]}",
                        ),
                      ),
                      SizedBox(
                        height: 32.scale,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}

// class MovieDetailPage extends GetView<MovieDetailController> {
//   get loadingComponent => Visibility(
//         visible: controller.isFetching,
//         child: Center(
//           heightFactor: 1,
//           widthFactor: 1,
//           child: SizedBox(
//             height: 25.scale,
//             width: 25.scale,
//             child: CircularProgressIndicator(
//               strokeWidth: 1.5,
//             ),
//           ),
//         ),
//       );

//   get textStyle => TextStyle(
//         fontSize: 16.scale,
//         fontWeight: FontWeight.bold,
//       );

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//           centerTitle: false,
//           title: Text(
//             "Detail",
//           ),
//           actions: [
//             Icon(icon)
//           ],
//         ),
//         body: Obx(() {
//           if (controller.isFetching) {
//             return Center(
//               child: loadingComponent,
//             );
//           } else {
//             return ListView(
//               physics: const BouncingScrollPhysics(
//                   parent: AlwaysScrollableScrollPhysics()),
//               children: [
//                 Image.network(
//                   "https://image.tmdb.org/t/p/w500/${controller.detailMovie["poster_path"]}",
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(
//                     16.scale,
//                   ),
//                   child: ListView(
//                     shrinkWrap: true,
//                     physics: ScrollPhysics(),
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 8.scale,
//                         ),
//                         child: Text(
//                           "${controller.detailMovie["original_title"]}",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 26.scale,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 4.scale,
//                         ),
//                         child: Text(
//                           "Original Language: ${controller.detailMovie["original_language"]}",
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 4.scale,
//                         ),
//                         child: Text(
//                           "Popularity Rate: ${controller.detailMovie["popularity"]}",
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 4.scale,
//                         ),
//                         child: Text(
//                           "Vote Average: ${controller.detailMovie["vote_average"]}",
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 4.scale,
//                         ),
//                         child: Text(
//                           "Vote Count: ${controller.detailMovie["vote_count"]}",
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 4.scale,
//                         ),
//                         child: Text(
//                           "Status: ${controller.detailMovie["status"]}",
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 4.scale,
//                         ),
//                         child: Text(
//                           "Tag Line: ${controller.detailMovie["tagline"]}",
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 4.scale,
//                         ),
//                         child: Text(
//                           "Overview: ${controller.detailMovie["overview"]}",
//                         ),
//                       ),
//                       SizedBox(
//                         height: 32.scale,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }
//         }),
//       ),
//     );
//   }
// }
