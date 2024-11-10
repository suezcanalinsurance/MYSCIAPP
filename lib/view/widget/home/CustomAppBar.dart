import 'package:suezproduction/core/class/CustomToolbarShape.dart';
import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget  {
  final double height;

  const CustomAppBar({required this.height});

  @override
  @override
  Widget build(BuildContext context) {
    return AppBar();
    return new Container(
        color: Colors.transparent,
        child: Stack(fit: StackFit.loose, children: <Widget>[
          Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: height,
              child: CustomPaint(
                painter: CustomToolbarShape(lineColor: Colors.deepOrange),
              )),
          Align(
              alignment: Alignment(0.0, 1.25),
              child: Container(
                  height: MediaQuery.of(context).size.height / 14.5,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                      decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20.0,
                            // shadow
                            spreadRadius: .5,
                            // set effect of extending the shadow
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                          )
                        ],
                      ),
                      child: TextField(
                          onSubmitted: (submittedText) {

                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black38,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1),                                    borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1),                               borderRadius:
                              BorderRadius.circular(25))))))),
          Align(
              alignment: Alignment(0.9, 0.0),
              child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 13,
                  child: InkWell(
                    onTap: () {
                    },
                    child: Icon(
                      Icons.local_mall,
                      color: Colors.black,
                    ),
                  ))),
          Align(
              alignment: Alignment(-0.9, 0.0),
              child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 13,
                  child: InkWell(
                      onTap: () {
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                      )))),
        ])
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }


}