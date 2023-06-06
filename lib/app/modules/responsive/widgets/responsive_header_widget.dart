import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../responsive_layout.dart';
import '../../../theme/my_text_theme.dart';
import '../responsive_layout_controller.dart';

class ResponsiveHeaderWidget extends PreferredSize {
  const ResponsiveHeaderWidget({Key? key})
      : super(
          key: key,
          preferredSize: const Size.fromHeight(80),
          child: const _HeaderContent(),
        );
}

class _HeaderContent extends StatelessWidget {
  const _HeaderContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<ResponsiveLayoutController>(
      init: ResponsiveLayoutController(),
      builder: (controller) {
        if (ResponsiveLayout.isTablet(context) ||
            ResponsiveLayout.isPhone(context)) {
          return AppBar(
            backgroundColor: Colors.white,
            elevation: 0.1,
            title: Text(
              screenWidth.toString(),
              style: MyTextTheme.defaultStyle(fontSize: 18.0),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 0),
              )
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ResponsiveLayout.isComputer(context)
                    ? const SizedBox.shrink()
                    : InkWell(
                        onTap: () => controller.toggleDrawer(),
                        child: const Icon(
                          Icons.menu,
                          size: 24.0,
                          color: Colors.black,
                        ),
                      ),
                const SizedBox(width: 26),
                Flexible(
                  child: Text(
                    screenWidth.toString(),
                    style: MyTextTheme.defaultStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forums",
                          style: MyTextTheme.defaultStyle(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Star Selling",
                          style: MyTextTheme.defaultStyle(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Our Product",
                          style: MyTextTheme.defaultStyle(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: () => controller.toggleEndDrawerPage(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 12,
                          ),
                        ),
                        icon: const Icon(
                          Icons.local_grocery_store,
                          size: 16.0,
                        ),
                        label: Text(
                          "Sign in",
                          style: MyTextTheme.defaultStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class HeaderContentController extends GetxController {}
