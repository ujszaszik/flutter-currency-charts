import 'package:currency_charts/features/main/ui/main_screen.dart';
import 'package:currency_charts/navigation/navigation_controller.dart';
import 'package:currency_charts/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  initNavigation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MainScreen(),
      getPages: Routes.all(),
    );
  }
}

void initNavigation() {
  Get.lazyPut(() => NavigationController(), fenix: true);
}