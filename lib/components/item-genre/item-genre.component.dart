import 'package:flutter/material.dart';
import 'package:flutter_application/components/item-genre/item-genre.controller.dart';
import 'package:flutter_application/models/genre.model.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:flutter_application/utils/extension.dart';

class ItemGenreComponent<T extends ItemGenreController> extends GetWidget<T> {
  final Genre item;
  final int index;

  ItemGenreComponent({Key? key, required this.item, required this.index})
      : super(key: key);

  Widget backgroundComponent(Color color) => Container(
        decoration: BoxDecoration(
          color: color.withOpacity(1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(12.scale),
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.25),
              blurRadius: 2.0.scale,
              spreadRadius: 0.0.scale,
              offset: Offset(
                  2.0.scale, 2.0.scale), // shadow direction: bottom right
            )
          ],
        ),
      );

  Widget textComponent(String value) => Positioned(
        bottom: 0,
        child: Padding(
          padding: EdgeInsets.all(16.scale),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16.scale,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget photoComponent(String imgUrl) => Positioned(
        // width: 120.scale,
        height: 110.scale,
        right: 0.scale,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.scale),
            bottomLeft: Radius.circular(12.scale),
          ),
          child: Image.network(
            imgUrl,
            scale: 2,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Color color =
        Color((math.Random().nextDouble() * 0xF0000 ~/ item.id).toInt());
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          backgroundComponent(color),
          textComponent(item.name),
          photoComponent(
            "https://loremflickr.com/380/320/${item.name}?time=",
            // + DateTime.now().hour.toString(),
          ),
        ],
      ),
      onTap: () {
        controller.onClick(index, item);
      },
    );
  }
}
