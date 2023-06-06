import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/my_text_theme.dart';
import '../responsive/responsive_layout.dart';
import 'controllers/authentication_controller.dart';
import 'views/authentication_forgot_account_view.dart';
import 'views/authentication_signin_account_view.dart';
import 'views/authentication_signup_account_view.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      init: AuthenticationController(),
      builder: (controller) {
        return Container(
          width: ResponsiveLayout.isComputer(context) ? 600 : 500,
          color: Colors.white,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ? Header
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  color: Colors.grey[900],
                  child: Text(
                    'MARKETPLACE',
                    style: MyTextTheme.defaultStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                //? Change Authentication page
                GetBuilder<AuthenticationController>(
                  init: AuthenticationController(),
                  builder: (controller) => Obx(
                    () => (controller.tabAuthIndex.value == 0)
                        ? const AuthenticationSignInAccountView()
                        : (controller.tabAuthIndex.value == 1)
                            ? const AuthenticationSignUpAccountView()
                            : const AuthenticationForgotAccountView(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
