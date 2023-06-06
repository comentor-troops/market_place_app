import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../theme/my_text_theme.dart';

class ProductCardItemWidget extends StatelessWidget {
  const ProductCardItemWidget({
    super.key,
    required this.productId,
    required this.productLogo,
    required this.productTitle,
    required this.productPriceFormat,
    required this.contentColor,
  });

  final String productId;
  final String productLogo;
  final String productTitle;
  final String productPriceFormat;
  final Color contentColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("${AppRoutes.productDetails}/$productId"),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
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
                              borderRadius: BorderRadius.circular(18),
                              child: SizedBox(
                                height: 80,
                                width: 80,
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
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Colors.purple,
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
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: const BorderSide(color: Colors.purple),
                              ),
                              padding: const EdgeInsets.symmetric(
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
