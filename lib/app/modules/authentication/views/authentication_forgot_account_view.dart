import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/my_text_theme.dart';
import '../controllers/authentication_controller.dart';
import '../widgets/authentication_choice_text_widget.dart';
import '../widgets/authentication_textformfield_widget.dart';

class AuthenticationForgotAccountView extends StatelessWidget {
  const AuthenticationForgotAccountView({super.key});

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
                  padding: const EdgeInsets.only(left: 64, top: 32, right: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // ? TITLE
                        'Forgot Password!!',
                        textAlign: TextAlign.justify,
                        style: MyTextTheme.defaultStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        // ? SUBTITLE
                        'Enter your details below to request an Marketplace \naccount password reset.',
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 32),
                      // ? Username
                      AuthenticationTextFormFieldWidget(
                        onChanged: (value) {},
                        label: 'Username',
                        hintText: 'Enter your username',
                      ),
                      const SizedBox(height: 32),
                      // ? Email
                      AuthenticationTextFormFieldWidget(
                        onChanged: (value) {},
                        label: 'Email',
                        hintText: 'Enter your email',
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
                      // ? Button Sign Up

                      const SizedBox(height: 16),
                      AuthenticationChoiceTextWidget(
                        onPressed: () {
                          controller.changeTabAuthentication(0);
                        },
                        label: 'do you Remember it?',
                        textButton: 'Sign in here',
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
                  child: Text(
                    'Marketplace collects and uses personal data in accordance with our Privacy Policy. By creating an account, you agree to our Terms & Conditions.',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey[900]),
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
