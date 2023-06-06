import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import '../../../data/model/category_response_model.dart';
import '../../../data/model/details_product_response_model.dart';
import '../../../data/model/product_response_model.dart';
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

  Future<List<Data>?> handleGetSearch(query) async {
    log('>> Begin  handleGetSearch <<');
    var search = await worker.prosesGetSearch(query);
    var searchResponseModel =
        ProductResponseModel.fromJson(json.decode(search)).paginate!.data;
    log('>> Success  handleGetSearch <<');
    return searchResponseModel;
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
