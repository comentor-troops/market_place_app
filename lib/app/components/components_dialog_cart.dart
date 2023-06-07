import 'package:comentor_marketplace_app/app/routes/app_routes.dart';
import 'package:comentor_marketplace_app/app/theme/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/responsive/responsive_layout.dart';
import '../theme/my_text_theme.dart';

class ComponentsDialogCart extends StatelessWidget {
  const ComponentsDialogCart(
      {super.key,
      required this.productLogo,
      required this.productTitle,
      required this.productAuthor,
      required this.productPrice});

  final String productLogo;
  final String productTitle;
  final String productAuthor;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 243,
      width: ResponsiveLayout.isPhone(context) ? null : 500,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Item added to your cart',
              style: MyTextTheme.defaultStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: Colors.black),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(productLogo.toString()),
                ),
              ),
              const SizedBox(width: 26),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle.toString(),
                    style: MyTextTheme.defaultStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productPrice.toString(),
                    style: MyTextTheme.defaultStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    " by: $productAuthor",
                    style: MyTextTheme.defaultStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ResponsiveLayout.isPhone(context)
              ? const SizedBox(height: 16)
              : const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: ResponsiveLayout.isPhone(context) ? null : 40,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        width: 0.5,
                        color: MyColors.primary,
                      ),
                    ),
                  ),
                  child: Text(
                    "Back",
                    style: MyTextTheme.defaultStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveLayout.isPhone(context) ? null : 40,
                child: ElevatedButton(
                  onPressed: () => Get.offNamed(AppRoutes.cart),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: MyColors.primary,
                  ),
                  child: Text(
                    "Checkout now",
                    style: MyTextTheme.defaultStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
