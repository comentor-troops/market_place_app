class ProductResponseModel {
  String? status;
  String? message;
  List<Data>? data;

  ProductResponseModel({this.status, this.message, this.data});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
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
  Category? category;
  SubCategory? subCategory;
  List<ProductScreenshot>? productScreenshot;

  Data(
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
      this.category,
      this.subCategory,
      this.productScreenshot});

  Data.fromJson(Map<String, dynamic> json) {
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
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    subCategory = json['sub_category'] != null
        ? SubCategory.fromJson(json['sub_category'])
        : null;
    if (json['product_screenshot'] != null) {
      productScreenshot = <ProductScreenshot>[];
      json['product_screenshot'].forEach((v) {
        productScreenshot!.add(ProductScreenshot.fromJson(v));
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subCategory != null) {
      data['sub_category'] = subCategory!.toJson();
    }
    if (productScreenshot != null) {
      data['product_screenshot'] =
          productScreenshot!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;

  Category({this.id, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    return data;
  }
}

class SubCategory {
  int? id;
  String? categoryId;
  String? subCategoryName;

  SubCategory({this.id, this.categoryId, this.subCategoryName});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryName = json['sub_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['sub_category_name'] = subCategoryName;
    return data;
  }
}

class ProductScreenshot {
  int? id;
  String? productId;
  String? productScreenshot;

  ProductScreenshot({this.id, this.productId, this.productScreenshot});

  ProductScreenshot.fromJson(Map<String, dynamic> json) {
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
