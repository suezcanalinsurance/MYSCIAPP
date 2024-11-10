class policyInfoModel {
  String? endDate;
  String? startDate;
  String? activecom;
  String? CurrName;
  String? paymentStatus;
  String? nameFor;
  String? insuName;
  String? printedSerials;
  String? polNo;
  String? activecom1;
  policyInfoModel({this.paymentStatus,
    this.endDate,
    this.startDate,
    this.activecom,
    this.activecom1,
    this.CurrName,
    this.nameFor,
    this.insuName,
    this.printedSerials,
    this.polNo,
  });



  policyInfoModel.fromJson(Map<String, dynamic> json) {
    paymentStatus = json['PaymentStatus'];
   endDate = json['EndDate'];
    startDate = json['StartDate'];
    activecom = json['Activecom'];
    activecom1 = json['Activecom1'];
    CurrName = json['CurrName'];
    nameFor = json['NameFor'];
    insuName = json['InsuName'];
    printedSerials = json['PrintedSerials'];
    polNo = json['PolNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PaymentStatus'] = this.paymentStatus;
    data['EndDate'] = this.endDate;
    data['StartDate'] = this.startDate;
    data['Activecom'] = this.activecom;
    data['Activecom1'] = this.activecom1;
    data['CurrName'] = this.CurrName;
    data['NameFor'] = this.nameFor;
    data['InsuName'] = this.insuName;
    data['PrintedSerials'] = this.printedSerials;
    data['PolNo'] = this.polNo;
    return data;
  }
}