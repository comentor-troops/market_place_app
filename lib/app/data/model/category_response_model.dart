class CategoryResponseModel {
  String? status;
  String? message;
  List<DataCategory>? data;

  CategoryResponseModel({this.status, this.message, this.data});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataCategory>[];
      json['data'].forEach((v) {
        data!.add(DataCategory.fromJson(v));
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

class DataCategory {
  int? id;
  String? categoryName;
  List<SubCategoryFromCategory>? subCategory;

  DataCategory({this.id, this.categoryName, this.subCategory});

  DataCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    if (json['sub_category'] != null) {
      subCategory = <SubCategoryFromCategory>[];
      json['sub_category'].forEach((v) {
        subCategory!.add(SubCategoryFromCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    if (subCategory != null) {
      data['sub_category'] = subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  copyWith({required String categoryName}) {}
}

class SubCategoryFromCategory {
  int? id;
  String? categoryId;
  String? subCategoryName;

  SubCategoryFromCategory({this.id, this.categoryId, this.subCategoryName});

  SubCategoryFromCategory.fromJson(Map<String, dynamic> json) {
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
