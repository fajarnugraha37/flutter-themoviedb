import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/extension.dart';

class ImageCircular extends GetWidget {
  final String imgUri;
  final double size = 50, marginTop, marginRight, marginBottom, marginLeft;

  ImageCircular({
    Key? key,
    required this.imgUri,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginLeft = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.scale,
      width: 80.scale,
      margin: EdgeInsets.only(
        top: marginTop,
        right: marginRight,
        bottom: marginBottom,
        left: marginLeft,
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          this.imgUri,
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
