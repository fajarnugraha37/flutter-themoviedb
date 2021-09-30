import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderEnlargeComponent extends GetWidget {
  final List<Widget> widgetList;
  final double aspectRatio;

  SliderEnlargeComponent({
    required this.widgetList,
    this.aspectRatio = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: this.aspectRatio,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: widgetList,
      ),
    );
  }
}
