import 'package:get/get.dart';

import 'responsive_layout_controller.dart';

class ResponsiveLayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ResponsiveLayoutController>(ResponsiveLayoutController(),
        permanent: true);
  }
}
