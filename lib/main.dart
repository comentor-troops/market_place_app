import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/services/api_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      defaultTransition: Transition.fade,
      initialBinding: ApiServiceBinding(),
      getPages: AppPages.pages,
    );
  }
}