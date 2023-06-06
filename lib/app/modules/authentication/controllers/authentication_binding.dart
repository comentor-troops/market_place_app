import 'package:get/get.dart';

import 'authentication_controller.dart';
import 'authentication_interactor.dart';
import 'authentication_worker.dart';

class AuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationWorker>(() => AuthenticationWorker());
    Get.lazyPut<AuthenticationInteractor>(() => AuthenticationInteractor());
    Get.lazyPut<AuthenticationController>(() => AuthenticationController());
  }
}
