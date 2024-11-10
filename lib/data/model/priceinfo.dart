class policyInfoModel {
  String? TotalPrem;


  policyInfoModel({
    this.TotalPrem,

  });



  policyInfoModel.fromJson(Map<String, dynamic> json) {

    TotalPrem = json['TotalPrem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalPrem'] = this.TotalPrem;

    return data;
  }
}