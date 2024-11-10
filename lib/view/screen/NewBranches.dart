import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:suezproduction/controller/Branches_controller.dart';
import 'package:suezproduction/core/constant/color.dart';
 import 'package:suezproduction/view/screen/Home.dart';
import 'package:suezproduction/view/screen/homescreen.dart';


class NewBranches extends StatelessWidget {
  BranchControllerTmp controller= Get.put(BranchControllerTmp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("branches".tr),  leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () =>   Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage())),
      )),
      body: const FutureBuilderExample(),
    );
  }
}



class Step {
  Step(
      this.BranchName,
      this.address,
      this.email,
      this.tel,
      this.tel2,
      this.tel3,
      this.fax,
      this.lat,
      this.lnd,
      this.ismain ,
  
      this.ishasdata ,
      [this.subSteps = const <Step>[]]
      );

  String BranchName;
  String address;
  String email;
  String tel;
  String tel2;
  String tel3;
  String fax;
  String lat;
  String lnd;
  String ismain;

  String ishasdata;
  List<Step> subSteps;
}
 
List<Step> getSteps() {
  return [

    Step("BranchName1".tr, "address1".tr,"info@sci-egypt.com" ,"02 37601056","02 37491365","","fax1".tr,"30.051333361189382","31.208407896642054","1","1",[


      Step("BranchNamesub1".tr, "", "","","",""  ,"","","","0","0",[
        Step("subIssuance1".tr, "","eng@sci-egypt.com","02 237602946","16569","","","","","0","1"),
        Step("subIssuance2".tr, "","eng_claim@sci-egypt.com","02 233386582","","16569","","","","0","1")]),

      Step("BranchNamesub3".tr, "", "","","",""  ,"","","","0","0",[
        Step("subIssuance1".tr, "", "cargo@sci-egypt.com","02 233365427","16569","","","","","0","1"),
        Step("subIssuance2".tr, "", "cargo_claims@sci-egypt.com","02 233356840","16569","","","","","0","1")]),

      Step("BranchNamesub4".tr, "", "","","",""  ,"","","","0","0",[
       Step("subIssuance1".tr, "", "hull@sci-egypt.com","02 237609509","16569","","","","","0","1"),
       Step("subIssuance2".tr, "", "hullclaim@sci-egypt.com","02 237492406","16569","","","","","0","1")]),

      Step("BranchNamesub8".tr, "", "","","",""  ,"","","","0","0",[
        Step("subIssuance1".tr, "", "g.accidents@sci-egypt.com","02 237498720","16569","","","","","0","1"),
        Step("subIssuance2".tr, "", "accclaim@sci-egypt.com","02 233363241","16569","","","","","0","1")]),

      Step("BranchNamesub6".tr, "", "","","",""  ,"","","","0","0",[
        Step("subIssuance1".tr, "", "fire@sci-egypt.com","02 233353065","","16569","","","","0","1"),
        Step("subIssuance2".tr, "", "fireclaim@sci-egypt.com","02 237602304","16569","","","","","0","1")]),

      Step("BranchNamesub2".tr, "", 'reinsurance@sci-egypt.com',"02 237617131","16569","","","","","0","1"),



    //   Step("BranchNamesub14".tr, "", 'crm@sci-egypt.net',"","","","","","","0","1"),
   //    Step("BranchNamesub15".tr, "", 'collect@sci-egypt.com',"","","","","","","0","1"),
    //   Step("BranchNamesub16".tr, "", 'mcollect@sci-egypt.com',"","","","","","","0","1"),

   //   Step("BranchNamesub9".tr, "", 'risk.management@sci-egypt.com',"02 37612863","","","","","","0","1"),

     // Step("BranchNamesub3".tr, '',"02 33356840","237492469","","","","","0","1"),
    //  Step("BranchNamesub4".tr, '',"02 33355219","02 33361251","02 37609509","","","","0","1"),
    //  Step("BranchNamesub5".tr, '',"02 37492406","","","","","","0","1"),
     // Step("BranchNamesub6".tr, '',"02 33387982","02 37602344","02 33355258-0237602304","","","","0","1"),
     // Step("BranchNamesub7".tr, '',"02 33386582","","","","","","0","1"),
     // Step("   اجسام سفن", '',"02 37499315","02 37499315","","","","0","1"),
   //   Step("BranchNamesub8".tr, '',"02 37600621","02 33363241","","","","","0","1"),
     //
/*      Step("BranchNamesub10".tr, '',"02 37625877","02 37625877-0237617133-0237617135","","","","0","1"),
      Step("BranchNamesub11".tr, '',"02 37628939","02 37628939-0233365164","","","","0","1"),
      Step("BranchNamesub12".tr, '',"02 33380990","02 33380990-0233355190","","","","0","1"),
      Step("BranchNamesub13".tr, '',"02 33366571","02 33366571-0233366596-0233361146","","","","0","1"),*/

    ]),

    Step("BranchName2".tr, "address2".tr, "", "02 37492703","02 37492703","16569","fax2".tr,"30.04793119575894","31.207289957671193","1","1",[
      Step("edary1name".tr, "", 'publicrelation@sci-egypt.com',"02 37492732","16569","","edary1fax".tr,"","","0","1"),
      Step("edary2name".tr, "", 'management@sci-egypt.com',"02 37616825","16569","","edary2fax".tr,"","","0","1"),

      Step("edary3name".tr, "", "","","",""  ,"","","","0","0",[
        Step("subIssuance1".tr, "", "motors@sci-egypt.com","02 37491396","16569","","edary3fax".tr,"","","0","1"),
        Step("subIssuance2".tr, "", "claim.motors@sci-egypt.net","02 33365517","16569","","edary4fax".tr,"","","0","1")]),






      Step("edary5name".tr, "", 'healthcare@sci-egypt.com',"02 33380990","16569","","edary5fax".tr,"","","0","1"),
      //Step("edary6name".tr, '',"01001798901","edary6tel".tr,"edary6fax".tr,"","","0","1"),
    ]),


    Step("BranchName3".tr, "", "", "","","","","","","1","0",[
      Step("cario0name".tr, "address3".tr, "cairo@sci-egypt.com","02 33382543","02 37601789","","fax3".tr,"30.037860","31.205080","0","1"),

      Step("cario1name".tr, "cario1address".tr, "regalalamal@sci-egypt.com","02 33360683","02 33360684","","cario1fax".tr,"30.042310","31.201500","0","1"),
      Step("cario2name".tr, "cario2address".tr, "mosadek@sci-egypt.com","02 37602894","","","cario2fax".tr,"30.032010","31.200900","0","1"),
      Step("cario3name".tr, "cario3address".tr, "shobra@sci-egypt.com","02 21960343","02 21960344","","cario3fax".tr,"30.074050","31.251020","0","1"),
    /*  Step("cario4name".tr, "cario4address".tr,"01098889674","cario4tel".tr,"cario4fax".tr,"30.044000","31.242080","0","1"),*/
      Step("cario5name".tr, "cario5address".tr, "maadi@sci-egypt.com","02 25172609","02 25173740","","cario5fax".tr,"29.977980","31.275110","0","1"),
      Step("cario6name".tr, "cario6address".tr, "teriumf@sci-egypt.com","02 24171681","02 24171063","","cario6fax".tr,"30.035080","31.486790","0","1"),
      Step("cario7name".tr, "cario7address".tr, "alahram@sci-egypt.com","02 24191758","02 24191729","","cario7fax".tr,"30.100860","31.327080","0","1"),
      Step("cario8name".tr, "cario8address".tr, "6october@sci-egypt.com","02 38332225","02 38332226","","cario8fax".tr,"29.961413004075723","30.923146482600558","0","1"),
      Step("cario9name".tr, "cario9address".tr, "10ramadan@sci-egypt.com","02 0554369143","","","cario9fax".tr,"30.291200","31.740620","0","1"),
    ]),

    Step("BranchName4".tr, "", "", "","" ,"","","","","1","0",[
      Step("bahary1name".tr, "bahary1address".tr, "banha@sci-egypt.com","0133250056","0133274550","","bahary1fax".tr,"30.466090","31.178630","0","1"),
      Step("bahary2name".tr, "bahary2address".tr, "shebeen@sci-egypt.com","0482232336","","","bahary2fax".tr,"31.531230","34.960640","0","1"),
      Step("bahary3name".tr, "bahary3address".tr, "tanta@sci-egypt.com","0403350829","","","bahary3fax".tr,"30.804500","30.992430","0","1"),
      Step("bahary4name".tr, "bahary4address".tr, "mansoura@sci-egypt.com","0502312193","0502101561","","bahary4fax".tr,"30.139590","31.071830","0","1"),
      Step("bahary5name".tr, "bahary5address".tr, "kafrelsheikh@sci-egypt.net","0473144491","0473144493","","bahary5fax".tr,"31.109760","30.940300","0","1"),
      Step("bahary6name".tr, "bahary6address".tr, "zakazek@sci-egypt.com","0552309391","0552386469","","bahary6fax".tr,"30.583420","31.488470","0","1"),
    ]),

    Step("BranchName5".tr, "", "","" ,"","","","","","1","0",[

      Step("alex0name".tr, "address5".tr, "alex@sci-egypt.com","tel5".tr ,"","","fax5".tr,"31.238500","29.962660","0","1"),
      Step("alex1name".tr, "alex1address".tr, "","034874720","034867985","","alex1fax".tr,"31.226140","29.967330","0","1"),
      Step("alex2name".tr, "alex2address".tr, "amria@sci-egypt.com","034500161","034500494","","alex2fax".tr,"31.094200","29.741450","0","1"),
      Step("alex3name".tr, "alex3address".tr, "borgelarab@sci-egypt.net","034593180","034593181","","alex3fax".tr,"31.211811","29.986643","0","1"),
    Step("alex4name".tr, "", "" ,"","","","","","","0","0",[
      Step("branchno1".tr, "alex4address".tr, "damnhor@sci-egypt.com","0453310051","0453310061","","alex4fax".tr,"31.039980","30.458980","0","1"),
      Step("branchno2".tr, "alex5address".tr, "","0453319258","","","alex5fax".tr,"31.035690","30.463870","0","1") ]),

    ])

    ,

    Step("BranchName6".tr, "", "","","","" ,"","","","1","0",[
    Step("canal1name".tr, "", "","","",""  ,"","","","0","0",[
      Step("branchno1".tr, "canal1address".tr, "ismalia@sci-egypt.com","0643914971","0643913199","","canal1fax".tr,"30.592830","32.272530","0","1"),
      Step("branchno2".tr, "canal2address".tr, "","0643921718","","","canal2fax".tr,"30.585630","32.172000","0","1")]),


      Step("canal3name".tr, "canal3address".tr, "ismaliaoffice@sci-egypt.com","0643488629","","","canal3fax".tr,"30.597538529418763","32.198663737013824","0","1"),
      Step("canal4name".tr, "canal4address".tr, "suez@sci-egypt.com","0623193511","0623197131","","canal4fax".tr,"29.971045115422","32.555195223003665","0","1"),
      Step("canal5name".tr, "canal5address".tr, "eladabiya@sci-egypt.com","01000423556","","","canal5fax".tr,"29.942530","32.565490","0","1"),
      Step("canal6name".tr, "canal6address".tr, "portsaid@sci-egypt.com","0663202645","0663233516","","canal6fax".tr,"31.265750","32.311820","0","1"),
      Step("canal7name".tr, "canal7address".tr, "menadomiat@sci-egypt.net","0572228193","0572232616","","canal7fax".tr,"31.417910","31.697070","0","1"),
      Step("canal8name".tr, "canal8address".tr, "hergada@sci-egypt.com","0653545750","0653551414","","canal8fax".tr,"27.252588610385022","33.81459789841684","0","1"),
    ]),


    Step("BranchName7".tr, "", "","", "" ,"","","","","1","0",[
      Step("qbly1name".tr, "qbly1address".tr, "fayoum@sci-egypt.com","0842065208","0842065209","" ,"qbly1fax".tr,"29.322700","30.854280","0","1"),
      Step("qbly2name".tr, "qbly2address".tr, "benisweif@sci-egypt.net","0822215292","0822215328","","qbly2fax".tr,"29.073730","31.112970","0","1"),
      Step("qbly3name".tr, "qbly3address".tr, "menia@sci-egypt.com","0862320282","0862372497","","qbly3fax".tr,"28.115860","30.729730","0","1"),
      Step("qbly4name".tr, "qbly4address".tr, "assut@sci-egypt.com","088237900","0882061665","","qbly4fax".tr,"27.187158","31.175422","0","1"),
      Step("qbly5name".tr, "qbly5address".tr, "sohag@sci-egypt.com","0932160118","","","qbly5fax".tr,"26.909830","31.442740","0","1"),
      Step("qbly6name".tr, "qbly6address".tr, "louxr@sci-egypt.com","0952270394","","","qbly6fax".tr,"25.679230","32.634300","0","1"),
      Step("qbly7name".tr, "qbly7address".tr, "aswan@sci-egypt.com","0972440089","","","qbly7fax".tr,"24.093430","32.907040","0","1")
    ]),
  ];
}


class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 1),
        () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    final List<Step> _steps = getSteps();
    return SingleChildScrollView(

      child: FutureBuilder<String>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Column(children: [

                PinchZoom(
                  child: Image.asset('assets/images/map.png'),
                  maxScale: 6.5,
                  onZoomStart: (){

                  },
                  onZoomEnd: (){

                  },
                )
                ,
                Container(
                    child: _renderSteps(_steps)
                ),
                InkWell(
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(

                      leading: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.blue,
                      ),
                      title:Text(
                        "back".tr,
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            color: Colors.blue.shade900),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                    //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                  },
                )
              ],)

            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children =  <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("wait".tr),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }

  Widget _renderSteps(List<Step> steps) {
    BranchControllerTmp controller= Get.put(BranchControllerTmp());
    return ExpansionPanelList.radio(
      children: steps.map<ExpansionPanelRadio>((Step step) {
        return ExpansionPanelRadio(

            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(step.BranchName,style: TextStyle(
                    fontSize: step.ismain=="1"? 18:16,
                    color:step.ismain=="1"? Colors.blue.shade900:Colors.blue)),
              );
            },
            body: ListTile(
                title:       Container(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(20)),

                    height: step.ishasdata=="0"? 0:190,
                    width: 360,
                    child:Column(children: [

                      InkWell(
                        onTap: (){
                          if (step.lat=="") {
                            const snackBar = SnackBar(
                              content: Text("لا توجد خريطة متاحه "),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          else {
                            controller.goToMap(
                                step.BranchName, step.lat, step.lnd);
                          }
                        },
                        child: step.address==''?Row():
                        Row( children: [Icon(Icons.fmd_good_sharp,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(step.address,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: (){

                        },
                        child: step.email==''?Row():
                        Row( children: [Icon(Icons.email,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(step.email,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                      ),
                      SizedBox(height: 5,),
                      step.tel==''?Row():

                      InkWell(
                        onTap: (){
                          FlutterPhoneDirectCaller.callNumber(step.tel);
                        },
                        child: Row( children: [

                          Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),
                          Text(step.tel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                      )

                      ,
                      step.tel2==''?Row():

                      InkWell(
                        onTap: (){
                          FlutterPhoneDirectCaller.callNumber(step.tel2);
                        },
                        child: Row( children: [

                          Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),
                          Text(step.tel2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                      ),
                      step.tel3==''?Row():

                      InkWell(
                        onTap: (){
                          FlutterPhoneDirectCaller.callNumber(step.tel3);
                        },
                        child: Row( children: [

                          Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),
                          Text(step.tel3,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                      )
                      ,
                      SizedBox(height: 5,),
                      step.fax==''?Row(): Row( children: [Icon(Icons.fax,color: AppColor.primaryColor),SizedBox(width: 4,),Text(step.fax,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
                    ],)),
                subtitle: _renderSteps(step.subSteps)
            ),
            value: step.BranchName
        );
      }).toList(),
    );
  }
}


