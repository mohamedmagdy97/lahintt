class CategoryModel {
  int? id;
  String? image;
  String? createdAt;
  String? name;
  String? describtion;
  bool? isActive;
  List<CategoryModel>? subCategory;

  CategoryModel({
    this.id,
    this.image,
    this.subCategory,
    this.createdAt,
    this.name,
    this.describtion,
    this.isActive,
  });

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    createdAt = json['createdAt'];
    name = json['name'];
    describtion = json['describtion'];
    isActive = json['isActive'] ?? false;

    if (json['sub_category'] != null) {
      subCategory = <CategoryModel>[];
      json['sub_category'].forEach((v) {
        subCategory!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['name'] = name;
    map['describtion'] = describtion;
    map['isActive'] = isActive ?? false;

    if (subCategory != null) {
      map['sub_category'] = subCategory!.map((v) => v.toJson()).toList();
    }

    return map;
  }
}
