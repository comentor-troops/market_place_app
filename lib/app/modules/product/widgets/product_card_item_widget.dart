import 'package:comentor_marketplace_app/app/modules/product/controllers/product_controller.dart';
import 'package:comentor_marketplace_app/app/theme/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../theme/my_text_theme.dart';
import '../../responsive/responsive_layout.dart';

class ProductCardItemWidget extends StatelessWidget {
  const ProductCardItemWidget({
    super.key,
    required this.productId,
    required this.productLogo,
    required this.productTitle,
    required this.productPriceFormat,
    required this.contentColor,
    this.onPressedCart,
    this.onPressedLivePreview,
  });

  final String productId;
  final String productLogo;
  final String productTitle;
  final String productPriceFormat;
  final Color contentColor;
  final void Function()? onPressedCart;
  final void Function()? onPressedLivePreview;
  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.toNamed("${AppRoutes.details}/$productId");
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 14, top: 14),
                  decoration: BoxDecoration(color: contentColor),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: ClipRRect(
                              borderRadius: isPhone
                                  ? BorderRadius.circular(8)
                                  : BorderRadius.circular(18),
                              child: SizedBox(
                                height: isPhone ? 50 : 80,
                                width: isPhone ? 50 : 80,
                                child: Image.network(
                                  productLogo,
                                  alignment: Alignment.bottomLeft,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              productTitle,
                              style: MyTextTheme.defaultStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' $productPriceFormat',
                          style: MyTextTheme.defaultStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 16,
                            glow: false,
                            ignoreGestures: true,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              debugPrint("$rating");
                            },
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '(0)',
                            style: MyTextTheme.defaultStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        ' 0 sales',
                        style: MyTextTheme.defaultStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: isPhone ? 40 : null,
                          child: ElevatedButton(
                            onPressed: onPressedCart,
                            style: ElevatedButton.styleFrom(
                              padding: isPhone
                                  ? null
                                  : const EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: MyColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide.none,
                              ),
                            ),
                            child: const Icon(
                              Icons.local_grocery_store,
                              size: 24.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          height: isPhone ? 40 : null,
                          child: ElevatedButton(
                            onPressed: onPressedLivePreview,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: const BorderSide(color: MyColors.primary),
                              ),
                              padding: isPhone
                                  ? null
                                  : const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 18,
                                    ),
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              'Live  preview',
                              style: MyTextTheme.defaultStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkeletonProductCardItemWidget extends GetView<ProductController> {
  const SkeletonProductCardItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors
              .grey[300], // Ubah warna latar belakang menjadi abu-abu muda
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 14, top: 14),
                decoration: const BoxDecoration(
                  color:
                      Colors.white, // Ubah warna latar belakang menjadi putih
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: ClipRRect(
                            borderRadius: isPhone
                                ? BorderRadius.circular(8)
                                : BorderRadius.circular(18),
                            child: Container(
                              height: isPhone ? 50 : 80,
                              width: isPhone ? 50 : 80,
                              color: Colors.grey[
                                  200], // Ubah warna latar belakang menjadi abu-abu muda
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            height: 16,
                            color: Colors.grey[
                                200], // Ubah warna latar belakang menjadi abu-abu muda
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: 100,
                        color: Colors.grey[
                            200], // Ubah warna latar belakang menjadi abu-abu muda
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 16,
                            glow: false,
                            ignoreGestures: true,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              debugPrint("$rating");
                            },
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '(0)',
                            style: MyTextTheme.defaultStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        ' 0 sales',
                        style: MyTextTheme.defaultStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: isPhone ? 40 : null,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: isPhone
                                  ? null
                                  : const EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Colors.grey[
                                  200], // Ubah warna latar belakang menjadi abu-abu muda
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide.none,
                              ),
                            ),
                            child: Icon(
                              Icons.local_grocery_store,
                              size: 24.0,
                              color: Colors.grey[
                                  400], // Ubah warna ikon menjadi abu-abu tua
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          height: isPhone ? 40 : null,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: const BorderSide(color: Colors.grey),
                              ),
                              padding: isPhone
                                  ? null
                                  : const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 18,
                                    ),
                              backgroundColor: Colors.grey[
                                  200], // Ubah warna latar belakang menjadi abu-abu muda
                            ),
                            child: Container(
                              height: 16,
                              width: 100,
                              color: Colors.grey[
                                  400], // Ubah warna teks menjadi abu-abu tua
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
