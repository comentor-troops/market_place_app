import 'package:comentor_marketplace_app/app/modules/product/views/product_cart_views.dart';
import 'package:get/get.dart';

import '../modules/authentication/authentication_page.dart';
import '../modules/authentication/controllers/authentication_binding.dart';
import '../modules/product/controllers/product_binding.dart';
import '../modules/product/prodcut_page.dart';
import '../modules/product/views/product_details_views.dart';
import '../modules/responsive/responsive_layout_binding.dart';
import '../modules/responsive/responsive_layout_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = AppRoutes.initial;
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const ResponsiveLayoutPage(),
      binding: ResponsiveLayoutBinding(),
      bindings: [
        AuthenticationBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.product,
      page: () => const ProductPage(),
      transition: Transition.noTransition,
      binding: ProductBinding(),
    ),
    GetPage(
      name: "${AppRoutes.details}/:id",
      page: () => const ProductDetailsViews(),
      binding: ProductBinding(),
      bindings: [
        AuthenticationBinding(),
        ResponsiveLayoutBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const ProductCartViews(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.authentication,
      page: () => const AuthenticationPage(),
      transition: Transition.noTransition,
      binding: AuthenticationBinding(),
    )
  ];
}
