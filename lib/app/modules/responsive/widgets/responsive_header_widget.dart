import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/authentication_page.dart';
import '../responsive_layout.dart';
import '../../../theme/my_text_theme.dart';
import '../responsive_layout_controller.dart';

class ResponsiveHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final BuildContext context;

  const ResponsiveHeaderWidget(
      {Key? key, required this.context, required this.useLeading})
      : super(key: key);

  @override
  Size get preferredSize => ResponsiveLayout.isPhone(context)
      ? const Size.fromHeight(40)
      : ResponsiveLayout.isTablet(context)
          ? const Size.fromHeight(60)
          : const Size.fromHeight(80);
  final bool useLeading;

  @override
  Widget build(BuildContext context) {
    return _HeaderContent(
      useLeading: useLeading,
    );
  }
}

class _HeaderContent extends StatelessWidget {
  const _HeaderContent({Key? key, this.useLeading = false}) : super(key: key);

  final bool useLeading;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResponsiveLayoutController>(
      init: ResponsiveLayoutController(),
      builder: (controller) {
        if (ResponsiveLayout.isTablet(context) ||
            ResponsiveLayout.isPhone(context)) {
          return AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leadingWidth: 70,
            elevation: 0.1,
            leading: useLeading == false
                ? IconButton(
                    splashRadius: 24,
                    onPressed: () => controller.toggleDrawer(),
                    icon: const Icon(
                      Icons.subject,
                      size: 24.0,
                      color: Colors.black,
                    ),
                  )
                : IconButton(
                    splashRadius: 24,
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 18.0,
                      color: Colors.black,
                    ),
                  ),
            title: Text(
              'Market Place',
              style: MyTextTheme.defaultStyle(fontSize: 18.0),
            ),
            actions: ResponsiveLayout.isTablet(context)
                ? [
                    IconButton(
                      splashRadius: 18,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      splashRadius: 18,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const Dialog(
                            child: AuthenticationPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                    const SizedBox(width: 16)
                  ]
                : [],
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
                          Icons.subject,
                          size: 24.0,
                          color: Colors.black,
                        ),
                      ),
                ResponsiveLayout.isComputer(context)
                    ? const SizedBox.shrink()
                    : const SizedBox(width: 26),
                Flexible(
                  flex: 2,
                  child: Text(
                    'Market Place',
                    style: MyTextTheme.defaultStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const Dialog(
                              child: AuthenticationPage(),
                            ),
                          );
                        },
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
