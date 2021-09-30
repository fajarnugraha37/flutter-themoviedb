import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/extension.dart';

class ImageCardCompoent extends GetWidget {
  final String imgUri;
  final double marginTop, marginRight, marginBottom, marginLeft;

  const ImageCardCompoent({
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
      margin: EdgeInsets.only(
        top: marginTop,
        right: marginRight,
        bottom: marginBottom,
        left: marginLeft,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.scale)),
        child: Image.network(
          this.imgUri,
        ),
      ),
    );
  }
}
