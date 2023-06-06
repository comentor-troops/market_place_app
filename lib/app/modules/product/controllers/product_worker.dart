import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/services/api_service.dart';

class ProductWorker {
  ApiService apiService = Get.find<ApiService>();
  Future<dynamic> prosesGetCategory() async {
    log('>> Begin prosesGetCategory');
    var value = await apiService.fetchGetCategory();
    log('>> Success prosesGetCategory');
    if (value.statusCode == 200 || value.statusCode == 201) {
      return value.body;
    } else {
      throw Exception('Failed to prosesGetCategory: ${value.statusCode}');
    }
  }

  Future<dynamic> prosesGetProduct() async =>
      await apiService.fetchGetProduct().then(
        (value) async {
          log('>> Begin  prosesGetProduct');
          if (value.statusCode == 200 || value.statusCode == 201) {
            log('>> Success  prosesGetProduct');
            return value.body;
          } else {
            throw Exception('Failed to prosesGetProduct: ${value.statusCode}');
          }
        },
      );

  Future<dynamic> prosesGetSearch(query) async =>
      await apiService.fetchGetSearch(query).then(
        (value) async {
          log('>> Begin  prosesGetSearch');
          if (value.statusCode == 200 || value.statusCode == 201) {
            log('>> Success  prosesGetSearch');
            return value.body;
          } else {
            throw Exception('Failed to prosesGetSearch: ${value.statusCode}');
          }
        },
      );

  Future<dynamic> prosesGetDetailsProduct(id) async =>
      await apiService.fetchGetDetailsProduct(id).then((value) async {
        log('>> Begin  prosesGetDetailProduct');
        if (value.statusCode == 200 || value.statusCode == 201) {
          log('>> Success  prosesGetDetailProduct');
          return value.body;
        } else {
          throw Exception(
              'Failed to prosesGetDetailProduct: ${value.statusCode}');
        }
      });
}
