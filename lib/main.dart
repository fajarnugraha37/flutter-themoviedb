import 'package:flutter/material.dart';
import 'package:flutter_application/main.route.dart';
import 'package:flutter_application/pages/error/error.page.dart';
import 'package:flutter_application/pages/index/index.binding.dart';
import 'package:flutter_application/pages/index/index.page.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Movie App",
      debugShowCheckedModeBanner: false,
      initialRoute: MainRoute.INITIAL,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.dark(),
      defaultTransition: Transition.cupertino,
      getPages: MainRoute.pages,
      home: IndexPage(),
      initialBinding: IndexBinding(),
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => ErrorPage(),
        );
      },
    );
  }
}
