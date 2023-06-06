import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication_interactor.dart';

class AuthenticationController extends GetxController {
  AuthenticationInteractor authenticationInteractor =
      Get.find<AuthenticationInteractor>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var isChecked = false.obs;
  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      // Do something
    }
  }

  final tabAuthIndex = 0.obs;
  void changeTabAuthentication(int index) {
    tabAuthIndex.value = index;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email address';
    } else if (!isValidEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  bool isValidEmail(String email) {
    // Add your own email validation logic here
    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
