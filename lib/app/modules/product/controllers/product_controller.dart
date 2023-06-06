import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/category_response_model.dart';
import '../../../data/model/details_product_response_model.dart';
import '../../../data/model/product_response_model.dart';
import 'product_interactor.dart';

class ProductController extends GetxController {
  ProductInteractor interactor = Get.find<ProductInteractor>();

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
    getCategory();
    getProduct();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  var isLoadingProduct = false.obs;
  var isLoadingCategory = false.obs;
  var isLoadingSearch = false.obs;
  List<DataCategory>? category;
  List<SubCategoryFromCategory>? subCategoryFromCategory;
  var selectedCategory = DataCategory().obs;
  var selectedCategoryTitle = ''.obs;

  getCategory() async {
    log('>> Begin getCategory <<');
    isLoadingCategory(true);
    try {
      category = await interactor.handleGetCategory();
      if (category != null) {
        category = category
            ?.map((category) {
              final categoryName = category.categoryName ?? '';
              final capitalizedCategoryName = categoryName.length > 1
                  ? categoryName[0] +
                      categoryName[1].toUpperCase() +
                      categoryName.substring(2)
                  : categoryName.toUpperCase();
              return category.copyWith(categoryName: capitalizedCategoryName);
            })
            .cast<DataCategory>()
            .toList();
        subCategoryFromCategory = category!
            .map((category) => category.subCategory ?? [])
            .expand((subCategoryFromCategory) => subCategoryFromCategory)
            .toList();
        if (category!.isNotEmpty) {
          selectedCategory.value = category![0];
          selectedCategoryTitle.value =
              capitalize(selectedCategory.value.categoryName.toString());
        }
      }
    } catch (e) {
      debugPrint('Error getCategory: $e');
    } finally {
      log('>> Success getCategory <<');
      isLoadingCategory(false);
    }
  }

  String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    } else if (text.toLowerCase() == 'ecommerce') {
      return 'eCommerce';
    } else {
      return text.substring(0, 1).toUpperCase() + text.substring(1);
    }
  }

  List<Data>? product;
  List<ProductScreenshot>? productScreenshot;
  getProduct() async {
    log('>> Begin  getProduct <<');
    isLoadingProduct(true);
    try {
      product = await interactor.handleGetProduct();
      productScreenshot = product!
          .map((product) => product.productScreenshot ?? [])
          .expand((productScreenshot) => productScreenshot)
          .toList();
    } catch (e) {
      debugPrint('Error getProduct: $e');
    } finally {
      log('>> Seccess  getProduct <<');
      isLoadingProduct(false);
    }
  }

  var isLoadingDetailsProduct = false.obs;
  DetailsData? detailsProduct;
  List<DetailsProductScreenshot>? detailsProductScreenshot;

  getDetailsProduct(id) async {
    log('>> Begin  getDetailsProduct <<');
    isLoadingDetailsProduct.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));

      detailsProduct = (await interactor.handleGetDetailsProduct(id))!;
      detailsProductScreenshot = detailsProduct!.productScreenshot;
    } catch (e) {
      debugPrint('Error getDetailsProduct: $e');
    } finally {
      log('>> Success  getDetailsProduct <<');
      isLoadingDetailsProduct.value = false;
    }
  }

  late TextEditingController searchController;

  RxList<Data> search = RxList<Data>([]);
  Future<void> getSearch(String query) async {
    log('>> Begin getSearch <<');
    isLoadingSearch.value = true;

    try {
      final keywords = query.split(' ');
      final results = <Data>{};

      for (var keyword in keywords) {
        final searchResults = await interactor.handleGetSearch(keyword);
        searchResults?.forEach((result) {
          if (!results.any((existingResult) =>
              existingResult.productTitle == result.productTitle)) {
            results.add(result);
          }
        });
      }

      search.assignAll(results.toList());
    } catch (e) {
      debugPrint('Error getSearch: $e');
    } finally {
      log('>> Success getSearch <<');
      isLoadingSearch.value = false;
    }
  }
}
