
class ProducerModel {
  String? producername;
  String? producercode;
  String? Birth_date;
  String? BranchName;
  String? age;
  String? job_name;
  String? kind;
  String? id_emp;
  String? retiredate;
  String? retiredate_period;
  String? eltzam;
  String? taeen_date;
  String? xQual;
  String? id_card;
  String? xQual_date;
  String? image;

  ProducerModel({
     this.producername,
    this.producercode,
    this.BranchName,
    this.age,
    this.Birth_date,
    this.job_name,
    this.kind,
    this.id_emp,
    this.retiredate,
    this.retiredate_period,
    this.eltzam,
    this.taeen_date,
    this.xQual,
    this.id_card,
    this.xQual_date,
    this.image,
  });

   ProducerModel.fromJson(Map<dynamic, dynamic> json) {

        producername= json['producername'];
        producercode = json['producercode'];
        BranchName = json['BranchName'];
        age = json['age'];
        Birth_date = json['Birth_date'];
        job_name =json['job_name'];
        kind = json['kind'];
        id_emp = json['id_emp'];
        retiredate =json['retiredate'];
        retiredate_period = json['retiredate_period'];
        eltzam = json['eltzam'];
        taeen_date = json['taeen_date'];
        xQual =json['xQual'];
    id_card = json['id_card'];
    xQual_date = json['xQual_date'];
    image = json['image'];

  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['producername'] = this.producername;
    data['producercode'] = this.producercode;
    data['BranchName'] = this.BranchName;
    data['age'] = this.age;
    data['Birth_date'] = this.Birth_date;
    data['job_name'] = this.job_name;
    data['kind'] = this.kind;
    data['id_emp'] = this.id_emp;
    data['retiredate'] = this.retiredate;
    data['retiredate_period'] = this.retiredate_period;
    data['eltzam'] = this.eltzam;
    data['taeen_date'] = this.taeen_date;
    data['xQual'] = this.xQual;
    data['id_card'] = this.id_card;
    data['xQual_date'] = this.xQual_date;
    data['image'] = this.image;
    return data;
  }
}