import 'dart:developer';

import 'package:flutter/material.dart';
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

  Future<dynamic> prosesGetProduct(currentPage) async =>
      await apiService.fetchGetProduct(currentPage).then(
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

  Future<dynamic> prosesGetSearch(query) async {
    try {
      log('>> Begin prosesGetSearch');
      var response = await apiService.fetchGetSearch(query);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('>> Success prosesGetSearch');
        return response.body;
      } else {
        throw Exception('Failed to prosesGetSearch: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error prosesGetSearch: $e');
      throw Exception('Failed to prosesGetSearch');
    }
  }

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
