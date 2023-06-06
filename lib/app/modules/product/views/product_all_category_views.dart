import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/model/product_response_model.dart';
import '../../../theme/utils/my_colors.dart';
import '../widgets/product_card_item_widget.dart';
import '../../responsive/responsive_layout.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_header_widget.dart';
import '../widgets/product_search_widget.dart';

class AllCategoryViews extends GetView<ProductController> {
  const AllCategoryViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isPhone = ResponsiveLayout.isPhone(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isPhone ? const SizedBox.shrink() : const ProductHeaderWidget(),
        isPhone ? const SizedBox.shrink() : const SizedBox(height: 24),
        ProductSearchWidget(
          constraints: const BoxConstraints(
            minHeight: 50,
            minWidth: 300,
            maxWidth: 500,
          ),
          controller: controller.searchController,
          onChanged: (query) => query.isEmpty
              ? controller.search.clear()
              : controller.getSearch(query),
        ),
        Obx(
          () {
            if (controller.isLoadingProduct.value) {
              return const CupertinoActivityIndicator();
            } else {
              List<Data> products = controller.search.isNotEmpty
                  ? controller.search
                  : controller.product!;
              return GridView.builder(
                gridDelegate: isPhone || isTablet
                    ? SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isPhone || isTablet ? 1 : 2,
                        childAspectRatio: 2 / 1.2,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24)
                    : const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 260,
                        maxCrossAxisExtent: 500,
                        crossAxisSpacing: 24,
                        childAspectRatio: 1,
                        mainAxisSpacing: 24),
                itemCount: products.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 26),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  var productItem = products[i];
                  return ProductCardItemWidget(
                    contentColor: MyColors.getRandomColor(i),
                    productId: products[i].id.toString(),
                    productLogo: productItem.productLogo!,
                    productTitle: productItem.productTitle!,
                    productPriceFormat: productItem.productPriceFormat!,
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
