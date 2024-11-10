class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameEn;
  String? categoriesImage;
  String? categoriesDate;

  CategoriesModel(
      {this.categoriesId,
        this.categoriesName,
        this.categoriesNameEn,
        this.categoriesImage,
        this.categoriesDate});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameEn = json['categories_name_en'];
    categoriesImage = json['categories_image'];
    categoriesDate = json['categories_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_en'] = this.categoriesNameEn;
    data['categories_image'] = this.categoriesImage;
    data['categories_date'] = this.categoriesDate;
    return data;
  }
}