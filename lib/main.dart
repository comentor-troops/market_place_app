import 'package:comentor_marketplace_app/app/modules/responsive/responsive_layout.dart';
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
      theme: ThemeData(
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      defaultTransition: ResponsiveLayout.isPhone(context)
          ? Transition.cupertino
          : Transition.noTransition,
      initialBinding: ApiServiceBinding(),
      getPages: AppPages.pages,
    );
  }
}
