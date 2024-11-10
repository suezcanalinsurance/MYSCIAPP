import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/data/datasource/remote/ClaimPolicyData.dart';
import 'package:suezproduction/data/model/claimmodel.dart';
import 'package:suezproduction/data/model/papers_model.dart';

class ClaimPage_resultControllerImp extends GetxController {

  List data = [];
  late String policyNo;
  late String chassisNo;
late String branchName_res="";
late String chassno_res="";
late String Benfishry_res="";
late String IsuuDate_res="";
late String EndDate_res="";
late String NetPrems_res="";
late String TotalPrems_res="";
late String note_res="";
late String IsOK_res="";
late String INSREQST_res="";
late String DateIn_res="";
late String DepID_res="";
late String ClaimValue_res="";
late String payval_res="";
late String reserve_res="";
late String AccDate_res="";
late String PlNo_res="";
late String AccNo_res="";
late String file_state_res="";


late String INSREQSTres="";
  late List<PapersModel> papers_list=[];

  ClaimPolicyData claimpolicyData = new ClaimPolicyData(Get.find());
  StatusRequest statusRequest= StatusRequest.none;
  late claimmodel claimmodel_model;
  @override
  void onInit() {
    // TODO: implement onInit
    initialData();
    super.onInit();
  }
  @override
  initialData() {
    // TODO: implement initialData
    policyNo=Get.arguments["policyNo"];
    chassisNo=Get.arguments["chassisNo"];


     getData(policyNo,chassisNo);
  //  papers_list= getpappers();
    update();

  }

  void getData(String policyNo,String chassisNo) async{

    statusRequest = StatusRequest.loading;
    update();
    var response = await claimpolicyData.postData(
        policyNo, chassisNo );
    // print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "notfound") {

        statusRequest = StatusRequest.notfound;
update();
      }
      else {
        data.addAll(response['data']);
        statusRequest = StatusRequest.success;
        update();
        claimmodel_model = claimmodel.fromJson(data[0]);
        branchName_res = claimmodel_model.branchName!;
        chassno_res = claimmodel_model.chassno!;
        Benfishry_res = claimmodel_model.benfishry!;
        IsuuDate_res = claimmodel_model.isuuDate!;
        EndDate_res = claimmodel_model.endDate!;
        NetPrems_res = claimmodel_model.netPrems!;
        TotalPrems_res = claimmodel_model.totalPrems!;


        INSREQST_res = claimmodel_model.iNSREQST!;

        ClaimValue_res = claimmodel_model.claimValue!;
        payval_res = claimmodel_model.payval!;
        reserve_res = claimmodel_model.reserve!;
        AccDate_res = claimmodel_model.accDate!;
        PlNo_res = claimmodel_model.plNo!;
        AccNo_res = claimmodel_model.accNo!;
        file_state_res = claimmodel_model.file_state!;
      }

    }

    else {
      Get.defaultDialog(
          title: "Warring", middleText: "حدثت مشكلة نرجو المحاولة في وقت لاحق");
      statusRequest = StatusRequest.failure;
    }
  }

  List<PapersModel> getpappers() {
      return [
        PapersModel(ser: "1",papers: "",date: "2022-02-02")
      ];
  }




}



