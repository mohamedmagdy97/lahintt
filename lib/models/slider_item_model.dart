class SliderItemModel {
  int? id;
  String? image;
  String? url;

  String? productId;
  String? vendorId;
  int? type;
  String? status;
  String? createdAt;

  SliderItemModel({
    this.id,
    this.productId,
    this.vendorId,
    this.image,
    this.url,
    this.type,
    this.status,
    this.createdAt,
  });

  SliderItemModel.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    vendorId = json['vendor_id'];
    image = json['image'];
    url = json['url'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['vendor_id'] = vendorId;
    map['image'] = image;
    map['url'] = url;
    map['type'] = type;
    map['status'] = status;
    map['created_at'] = createdAt;

    return map;
  }
}
