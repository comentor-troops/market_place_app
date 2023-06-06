import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/my_text_theme.dart';
import '../../responsive/responsive_layout.dart';
import '../controllers/authentication_controller.dart';
import '../widgets/authentication_button_icon_widget.dart';
import '../widgets/authentication_choice_text_widget.dart';
import '../widgets/authentication_divider_text_widget.dart';
import '../widgets/authentication_textformfield_widget.dart';

class AuthenticationSignUpAccountView extends StatelessWidget {
  const AuthenticationSignUpAccountView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      init: AuthenticationController(),
      builder: (controller) {
        return Form(
          child: Flexible(
            flex: 2,
            child: ListView(
              children: [
                Padding(
                  padding: ResponsiveLayout.isPhone(context)
                      ? const EdgeInsets.only(left: 24, right: 24)
                      : const EdgeInsets.only(left: 64, top: 32, right: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          // ? TITLE
                          'Great to see you here!!',
                          style: MyTextTheme.defaultStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(height: 52),
                      // ? Fullname
                      const AuthenticationTextFormFieldWidget(
                        label: 'Fullname',
                        hintText: 'Enter your fullname',
                      ),
                      const SizedBox(height: 32),
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
                      const SizedBox(height: 8),
                      Text(
                        'Use 8 or more characters with a mix of letters, numbers and symbols. Must not contain your name or username.',
                        textAlign: TextAlign.left,
                        style: MyTextTheme.defaultStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: ResponsiveLayout.isPhone(context)
                      ? const EdgeInsets.symmetric(
                          horizontal: 26,
                        )
                      : const EdgeInsets.symmetric(
                          horizontal: 64,
                          vertical: 32,
                        ),
                  child: Column(
                    children: [
                      // ? Button Sign Up

                      const SizedBox(height: 52),
                      const AuthenticationDividerTextWidget(
                        label: 'or sign up with',
                      ),
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
                          controller.changeTabAuthentication(0);
                        },
                        label: 'Already have an Marketplace Account?',
                        textButton: 'Sign in here',
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: ResponsiveLayout.isPhone(context)
                      ? const EdgeInsets.symmetric(horizontal: 26, vertical: 32)
                      : const EdgeInsets.symmetric(
                          horizontal: 64, vertical: 32),
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
