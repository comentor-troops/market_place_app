import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components_textbutton_widget.dart';
import '../../../theme/my_text_theme.dart';
import '../controllers/authentication_controller.dart';
import '../widgets/authentication_button_icon_widget.dart';
import '../widgets/authentication_checkbox_widget.dart';
import '../widgets/authentication_choice_text_widget.dart';
import '../widgets/authentication_divider_text_widget.dart';
import '../widgets/authentication_textformfield_widget.dart';

class AuthenticationSignInAccountView extends StatelessWidget {
  const AuthenticationSignInAccountView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      init: AuthenticationController(),
      builder: (controller) {
        return Form(
          child: Flexible(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 64, top: 32, right: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          // ? TITLE
                          'Great to have you back!!',
                          style: MyTextTheme.defaultStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(height: 52),
                      // ? Username
                      const AuthenticationTextFormFieldWidget(
                        label: 'Username or email',
                        hintText: 'Enter your username or email',
                      ),
                      const SizedBox(height: 32),
                      // ? Password
                      const AuthenticationTextFormFieldWidget(
                        label: 'Password',
                        hintText: 'Enter your password',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 52),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //  ? Checkbox Remember me
                      Obx(
                        () => AuthenticationCheckboxWidget(
                          value: controller.isChecked.value,
                          onChanged: (value) =>
                              controller.toggleCheckbox(value!),
                        ),
                      ),
                      // ? Forgot Password
                      ComponentsTextButtonWidget(
                        onPressed: () => controller.changeTabAuthentication(2),
                        overlayColor: Colors.transparent,
                        child: Text(
                          'Forgot password ?',
                          style: MyTextTheme.defaultStyle(color: null),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 32,
                  ),
                  child: Column(
                    children: [
                      // ? Button Sign in

                      const SizedBox(height: 52),
                      const AuthenticationDividerTextWidget(
                          label: 'or sign in with'),
                      const SizedBox(height: 52),
                      Row(
                        children: [
                          // ? Continue with
                          Expanded(
                            flex: 1,
                            child: AuthenticationButtonIconWidget(
                              label: 'Apple',
                              icon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Icon(
                                  Icons.apple,
                                  color: Colors.grey[900],
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 32),
                          // ? Continue with
                          Expanded(
                            flex: 1,
                            child: AuthenticationButtonIconWidget(
                              label: 'Apple',
                              icon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Icon(
                                  Icons.apple,
                                  color: Colors.grey[900],
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AuthenticationChoiceTextWidget(
                        onPressed: () {
                          controller.changeTabAuthentication(1);
                        },
                        label: 'New Here ?',
                        textButton: 'Create an Marketplace account',
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Text(
                    'Marketplace collects and uses personal data in accordance with our Privacy Policy. By creating an account, you agree to our Terms & Conditions.',
                    textAlign: TextAlign.left,
                    style: MyTextTheme.defaultStyle(),
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
