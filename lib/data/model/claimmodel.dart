class claimmodel {
  String? branchName;
  String? chassno;
  String? benfishry;
  String? isuuDate;

  String? endDate;
  String? netPrems;
  String? totalPrems;
  String? note;
  String? isOK;
  String? iNSREQST;
  String? dateIn;
  String? depID;
  String? claimValue;
  String? payval;
  String? reserve;
  String? accDate;
  String? plNo;
  String? accNo;
  String? file_state;

  claimmodel(
      {this.branchName,
        this.chassno,
        this.benfishry,
        this.isuuDate,

        this.endDate,
        this.netPrems,
        this.totalPrems,
        this.note,
        this.isOK,
        this.iNSREQST,
        this.dateIn,
        this.depID,
        this.claimValue,
        this.payval,
        this.reserve,
        this.accDate,
        this.plNo,
        this.accNo,
        this.file_state

      });

  claimmodel.fromJson(Map<String, dynamic> json) {
    branchName = json['BranchName'];
    chassno = json['chassno'];
    benfishry = json['Benfishry'];
    isuuDate = json['IsuuDate'];

    endDate = json['EndDate'];
    netPrems = json['NetPrems'];
    totalPrems = json['TotalPrems'];
    note = json['Note'];
    isOK = json['IsOK'];
    iNSREQST = json['INSREQST'];
    dateIn = json['DateIn'];
    depID = json['DepID'];
    claimValue = json['ClaimValue'];
    payval = json['payval'];
    reserve = json['reserve'];
    accDate = json['AccDate'];
    plNo = json['PlNo'];
    accNo = json['AccNo'];
    file_state = json['file_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BranchName'] = this.branchName;
    data['chassno'] = this.chassno;
    data['Benfishry'] = this.benfishry;
    data['IsuuDate'] = this.isuuDate;

    data['EndDate'] = this.endDate;
    data['NetPrems'] = this.netPrems;
    data['TotalPrems'] = this.totalPrems;
    data['Note'] = this.note;
    data['IsOK'] = this.isOK;
    data['INSREQST'] = this.iNSREQST;
    data['DateIn'] = this.dateIn;
    data['DepID'] = this.depID;
    data['ClaimValue'] = this.claimValue;
    data['payval'] = this.payval;
    data['reserve'] = this.reserve;
    data['AccDate'] = this.accDate;
    data['PlNo'] = this.plNo;
    data['AccNo'] = this.accNo;
    return data;
  }
}