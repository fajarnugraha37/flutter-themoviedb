import 'package:flutter/material.dart';
import 'package:flutter_application/utils/extension.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 50.scale,
            color: Colors.red,
          ),
          SizedBox(
            height: 16.scale,
          ),
          Text(
            'Opps, Halaman yang anda cari tidak ada',
            style: TextStyle(
              fontSize: 24.scale,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
