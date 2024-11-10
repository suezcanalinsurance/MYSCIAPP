class itemsmodel {
  String? itemsId;
  String? itemsCat;
  String? itemsName;
  String? itemsNameEn;
  String? itemsDesc;
  String? itemsDescEn;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsPrice;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameEn;
  String? categoriesImage;
  String? categoriesDate;
  String? email;
  itemsmodel(
      {this.itemsId,
        this.itemsCat,
        this.itemsName,
        this.itemsNameEn,
        this.itemsDesc,
        this.itemsDescEn,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsPrice,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNameEn,
        this.categoriesImage,
        this.categoriesDate,
        this.email});

  itemsmodel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsCat = json['items_cat'];
    itemsName = json['items_name'];
    itemsNameEn = json['items_name_en'];
    itemsDesc = json['items_desc'];
    itemsDescEn = json['items_desc_en'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsPrice = json['items_price'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameEn = json['categories_name_en'];
    categoriesImage = json['categories_image'];
    categoriesDate = json['categories_date'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_cat'] = this.itemsCat;
    data['items_name'] = this.itemsName;
    data['items_name_en'] = this.itemsNameEn;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_en'] = this.itemsDescEn;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_price'] = this.itemsPrice;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_en'] = this.categoriesNameEn;
    data['categories_image'] = this.categoriesImage;
    data['categories_date'] = this.categoriesDate;
    data['email'] = this.email;
    return data;
  }
}