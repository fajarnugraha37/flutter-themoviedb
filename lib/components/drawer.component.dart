import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../utils//extension.dart';

class DrawerComponent extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    "Guest",
                    style: TextStyle(
                      fontSize: 12.scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "-",
                    style: TextStyle(
                      fontSize: 12.scale,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 12.scale,
                  top: 8.scale,
                  bottom: 8.scale,
                  left: 16.scale,
                ),
                width: 50.scale,
                height: 50.scale,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.scale)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: ExactAssetImage("images/farm-house.jpg"),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          DrawerItemComponent(
            iconData: Icons.play_circle_fill,
            title: "Now Playing",
            callback: () {
              Get.toNamed("/now-palying");
            },
          ),
          DrawerItemComponent(
            iconData: Icons.near_me,
            title: "Coming Soon",
            callback: () {
              Get.toNamed("/coming-soon");
            },
          ),
          DrawerItemComponent(
            iconData: Icons.group_work,
            title: "Popular",
            callback: () {
              Get.toNamed("/popular");
            },
          ),
        ],
      ),
    );
  }
}

class DrawerItemComponent extends GetWidget {
  final IconData iconData;
  final String title;
  final Function callback;

  const DrawerItemComponent({
    required this.title,
    required this.iconData,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        iconData,
        size: 20.scale,
      ),
      title: Text(
        title,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 16.scale,
        ),
      ),
      onTap: () {
        callback();
      },
    );
  }
}
