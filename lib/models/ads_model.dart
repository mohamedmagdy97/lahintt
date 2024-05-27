class AdsModel {
  AdsModel({
    this.id,
    this.image,
    this.url,
    this.status,
    this.title,
    this.description,
    this.type,
    this.isLast = false,
    this.index = 0,
  });

  int? id;
  String? image;
  String? url;
  String? status;
  String? title;
  String? description;
  int? type;
  final bool? isLast;
  final int? index;

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
        id: json["id"],
        image: json["image"],
        url: json["url"],
        status: json["status"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "url": url,
        "status": status,
        "title": title,
        "description": description,
        "type": type,
      };
}
