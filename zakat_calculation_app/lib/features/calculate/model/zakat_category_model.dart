class ZakatCategoryModel {
  String categoryName;
  String photoUrl;
  void Function() onTap;

  ZakatCategoryModel(
      {required this.categoryName,
      required this.photoUrl,
      required this.onTap});
}
