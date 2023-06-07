import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import '../../../data/model/category_response_model.dart';
import '../../../data/model/details_product_response_model.dart';
import '../../../data/model/product_response_model.dart';
import '../../../data/model/search_response_model.dart';
import 'product_worker.dart';

class ProductInteractor {
  ProductWorker worker = Get.find<ProductWorker>();
  Future<List<DataCategory>?> handleGetCategory() async {
    log('>> Begin handleGetCategory <<');
    var category = await worker.prosesGetCategory();
    var categoryResponseModel =
        CategoryResponseModel.fromJson(json.decode(category)).data;
    log('>> Success handleGetCategory <<');
    return categoryResponseModel ?? [];
  }

  Future<Paginate?> handleGetProduct(currentPage) async {
    log('>> Begin  handleGetProduct <<');
    var product = await worker.prosesGetProduct(currentPage);
    var productResponseModel =
        ProductResponseModel.fromJson(json.decode(product)).paginate;
    log('>> Success  handleGetProduct <<');
    return productResponseModel;
  }

  Future<List<DataSearch>?> handleGetSearch(String query) async {
    log('>> Begin handleGetSearch <<');

    try {
      final search = await worker.prosesGetSearch(query);
      final searchResponse = SearchResponseModel.fromJson(json.decode(search));
      final searchResponseModel = searchResponse.data;

      log('>> Success handleGetSearch <<');
      return searchResponseModel;
    } catch (e) {
      log('>> Error handleGetSearch: $e <<');
      return null;
    }
  }

  Future<DetailsData?> handleGetDetailsProduct(id) async {
    log('>> Begin  handleGetDetailsProduct <<');
    var detail = await worker.prosesGetDetailsProduct(id);
    var detailResponseModel =
        DetailsProductResponseModel.fromJson(json.decode(detail)).data;
    log('>> Success  handleGetDetailsProduct <<');
    return detailResponseModel;
  }
}
