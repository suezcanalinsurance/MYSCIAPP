import 'package:flutter/cupertino.dart';

class BranchModel {
   String header;
    String BranchName;
    String address;
     String tel;
    String email;
    bool isExpanded;

  BranchModel({required this.header,required this.BranchName,required  this.address, required this.tel,required this.email, this.isExpanded = false,});
}



