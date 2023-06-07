import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/category_response_model.dart';
import '../../../data/model/details_product_response_model.dart';
import '../../../data/model/product_response_model.dart';
import '../../../data/model/search_response_model.dart';
import 'product_interactor.dart';

class ProductController extends GetxController {
  ProductInteractor interactor = Get.find<ProductInteractor>();

  @override
  void onInit() {
    searchController.value = TextEditingController();
    searchController.value.addListener(() {
      final searchText = searchController.value.text;
      if (searchText.isEmpty) {
        getProduct();
      }
    });

    super.onInit();
    getCategory();
    getProduct();
  }

  @override
  void onClose() {
    searchController.value.dispose();
    super.onClose();
  }

  var isLoadingCategory = false.obs;

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

  var currentPage = 1.obs;
  var totalPages = 0.obs;
  var lastPage = 0.obs;
  var nextPageUrl = ''.obs;
  var prevPageUrl = ''.obs;
  var perPage = 0.obs;
  var isLoadingProduct = false.obs;
  Paginate? paginate;
  List<Data>? products;
  getProduct() async {
    log('>> Begin getProduct <<');
    isLoadingProduct.value = true;
    products?.clear();
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      paginate = await interactor.handleGetProduct(currentPage.value);

      if (paginate != null) {
        perPage.value = paginate!.perPage ?? 0;
        currentPage.value = paginate!.currentPage ?? 1;
        totalPages.value = paginate!.total ?? 0;
        lastPage.value = paginate!.lastPage ?? paginate!.currentPage ?? 1;
        nextPageUrl.value = paginate!.nextPageUrl ?? '';
        prevPageUrl.value = paginate!.prevPageUrl ?? '';

        if (paginate!.data != null) {
          products = RxList<Data>(paginate!.data!);
        }
        update();
      }
    } catch (e) {
      debugPrint('Error getProduct: $e');
    } finally {
      log('>> Success getProduct <<');
      isLoadingProduct.value = false;
    }
  }

  goToNextPage() async {
    if (nextPageUrl.value.isNotEmpty) {
      currentPage.value++;
      await getProduct();
      update();
    }
  }

  goToPreviousPage() async {
    if (prevPageUrl.value.isNotEmpty) {
      currentPage.value--;
      await getProduct();
      update();
    }
  }

  goToPage(int page) async {
    if (page >= 1 && page <= totalPages.value) {
      currentPage.value = page;
      await getProduct();
      update();
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

  late var searchController = TextEditingController().obs;
  var isLoadingSearch = false.obs;

  RxList<DataSearch> search = RxList<DataSearch>([]);

  void getSearch(String query) async {
    log('>> Begin getSearch <<');
    isLoadingSearch.value = true;
    try {
      final keywords = query.split(' ');
      var results = <DataSearch>[];

      if (query.isEmpty) {
        search.clear();
        isSearching.value = false;
      } else {
        for (var keyword in keywords) {
          final searchResults = await interactor.handleGetSearch(keyword);

          if (searchResults != null) {
            results.addAll(searchResults);
          }
        }
        search.assignAll(results);
        isSearching.value = results.isNotEmpty;
      }

      log('>> Success getSearch <<');
      isLoadingSearch.value = false;
    } catch (e) {
      debugPrint('Error getSearch: $e');
    }
  }

  RxBool isSearching = false.obs;
  void setIsSearching(bool value) {
    isSearching.value = value;
  }
}
