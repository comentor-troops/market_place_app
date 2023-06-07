import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetConnect {
  final String url = 'https://marketplace.irfancode.my.id/';

  Future<http.Response> fetchGetCategory() {
    log('>> Succsess fetchGetCategory <<');
    return http.get(Uri.parse('${url}api/v1/category'));
  }

  Future<http.Response> fetchGetProduct(currentPage) {
    log('>> Succsess fetchGetProduct <<');
    return http.get(Uri.parse('${url}public/api/v1/product?page=$currentPage'));
  }

  Future<http.Response> fetchGetSearch(query) {
    return http.get(Uri.parse('${url}api/v1/product/search?q=$query')).then(
      (response) {
        log('>> Success fetchGetSearch <<');
        return response;
      },
    );
  }

  Future<http.Response> fetchGetDetailsProduct(id) {
    log('>> Succsess fetchGetDetailProduct <<');
    return http.get(Uri.parse('${url}api/v1/product/detail?product_id=$id'));
  }
}
