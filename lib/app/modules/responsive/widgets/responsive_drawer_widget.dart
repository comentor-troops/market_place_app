import 'package:comentor_marketplace_app/app/modules/responsive/responsive_layout_controller.dart';
import 'package:comentor_marketplace_app/app/theme/my_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/utils/my_colors.dart';
import '../../authentication/authentication_page.dart';

class ResponsiveDraweWidget extends GetView<ResponsiveLayoutController> {
  const ResponsiveDraweWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.symmetric(vertical: 26),
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[500],
              child: const Icon(
                Icons.face,
                size: 58.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(
            controller.icon.length,
            (i) => MouseRegion(
              onEnter: (_) => controller.isHovered[i] = true,
              onExit: (_) => controller.isHovered[i] = false,
              child: GetBuilder<ResponsiveLayoutController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListTile(
                      dense: true,
                      splashColor: MyColors.primary.withOpacity(0.2),
                      hoverColor: MyColors.primary.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onTap: () {
                        if (i == 4) {
                          Navigator.pop(context); // Menutup drawer
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthenticationPage(),
                            ),
                          );
                        } else {
                          return;
                        }
                      },
                      leading: Obx(
                        () => Icon(
                          controller.icon[i],
                          size: 20,
                          color:
                              controller.isHovered[i] ? MyColors.primary : null,
                        ),
                      ),
                      title: Obx(
                        () => Text(
                          controller.name[i],
                          style: MyTextTheme.defaultStyle(
                            fontWeight: FontWeight.w600,
                            color: controller.isHovered[i]
                                ? MyColors.primary
                                : null,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
