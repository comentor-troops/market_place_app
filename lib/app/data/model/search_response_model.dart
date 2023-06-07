class SearchResponseModel {
  String? status;
  String? message;
  List<DataSearch>? data;

  SearchResponseModel({this.status, this.message, this.data});

  SearchResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSearch>[];
      json['data'].forEach((v) {
        data!.add(DataSearch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataSearch {
  int? id;
  String? categoryId;
  String? subCategoryId;
  String? productTitle;
  String? productDescription;
  String? productAuthor;
  String? productPrice;
  String? productDiscount;
  String? productLogo;
  String? productLinkPlaystore;
  String? productLinkAppstore;
  String? productLinkOther;
  String? productPriceFormat;
  String? productDiscountFormat;

  DataSearch(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.productTitle,
      this.productDescription,
      this.productAuthor,
      this.productPrice,
      this.productDiscount,
      this.productLogo,
      this.productLinkPlaystore,
      this.productLinkAppstore,
      this.productLinkOther,
      this.productPriceFormat,
      this.productDiscountFormat});

  DataSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    productTitle = json['product_title'];
    productDescription = json['product_description'];
    productAuthor = json['product_author'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productLogo = json['product_logo'];
    productLinkPlaystore = json['product_link_playstore'];
    productLinkAppstore = json['product_link_appstore'];
    productLinkOther = json['product_link_other'];
    productPriceFormat = json['product_price_format'];
    productDiscountFormat = json['product_discount_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['product_title'] = productTitle;
    data['product_description'] = productDescription;
    data['product_author'] = productAuthor;
    data['product_price'] = productPrice;
    data['product_discount'] = productDiscount;
    data['product_logo'] = productLogo;
    data['product_link_playstore'] = productLinkPlaystore;
    data['product_link_appstore'] = productLinkAppstore;
    data['product_link_other'] = productLinkOther;
    data['product_price_format'] = productPriceFormat;
    data['product_discount_format'] = productDiscountFormat;
    return data;
  }
}
