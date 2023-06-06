class DetailsProductResponseModel {
  String? status;
  String? message;
  DetailsData? data;

  DetailsProductResponseModel({this.status, this.message, this.data});

  DetailsProductResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DetailsData {
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
  Null productLinkOther;
  String? productPriceFormat;
  String? productDiscountFormat;
  List<DetailsProductScreenshot>? productScreenshot;

  DetailsData(
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
      this.productDiscountFormat,
      this.productScreenshot});

  DetailsData.fromJson(Map<String, dynamic> json) {
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
    if (json['product_screenshot'] != null) {
      productScreenshot = <DetailsProductScreenshot>[];
      json['product_screenshot'].forEach((v) {
        productScreenshot!.add(DetailsProductScreenshot.fromJson(v));
      });
    }
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
    if (productScreenshot != null) {
      data['product_screenshot'] =
          productScreenshot!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailsProductScreenshot {
  int? id;
  String? productId;
  String? productScreenshot;

  DetailsProductScreenshot({this.id, this.productId, this.productScreenshot});

  DetailsProductScreenshot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productScreenshot = json['product_screenshot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product_screenshot'] = productScreenshot;
    return data;
  }
}
