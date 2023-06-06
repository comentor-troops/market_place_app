import 'package:get/get.dart';

import 'product_controller.dart';
import 'product_interactor.dart';
import 'product_worker.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductWorker>(ProductWorker());
    Get.put<ProductInteractor>(ProductInteractor());
    Get.put<ProductController>(ProductController());
  }
}
