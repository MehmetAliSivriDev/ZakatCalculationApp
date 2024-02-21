class CategoryHowModel {
  String? categoryName;
  String? categoryDetail;
  String? photoUrl;
  String? from;
  String? to;
  String? calculateInfo;

  CategoryHowModel(
      {this.categoryName,
      this.categoryDetail,
      this.photoUrl,
      this.from,
      this.to,
      this.calculateInfo});

  CategoryHowModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categoryDetail = json['category_detail'];
    photoUrl = json['photo_url'];
    from = json['from'];
    to = json['to'];
    calculateInfo = json['calculate_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    data['category_detail'] = this.categoryDetail;
    data['photo_url'] = this.photoUrl;
    data['from'] = this.from;
    data['to'] = this.to;
    data['calculate_info'] = this.calculateInfo;
    return data;
  }
}
