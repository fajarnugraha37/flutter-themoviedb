import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/extension.dart';

class EnlargeItemComponent extends GetWidget {
  final String imgUri;
  final bool isNetwork;

  EnlargeItemComponent({
    Key? key,
    required this.imgUri,
    required this.isNetwork,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16.0.scale,
        right: 16.0.scale,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0.scale),
        ),
        child: Stack(
          children: <Widget>[
            Image.network(
              this.imgUri,
              fit: BoxFit.cover,
              width: 1000.0.scale,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 40.0.scale,
                  horizontal: 10.0.scale,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
