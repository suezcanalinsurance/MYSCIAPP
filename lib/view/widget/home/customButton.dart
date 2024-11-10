import 'package:flutter/material.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';


class MyCustomBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 2.0),
                  blurRadius: 8.0,
                  spreadRadius: 2.0)
            ]),
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    width: 40.0,
                    height: 48.0,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child:  ClipOval(
                          child: Image.asset(
                            AppImageAsset.ar,
                          ),
                        ))),
                Expanded(
                    child: Center(
                      child: Text("اللغة العربية",
                          style: Theme.of(context).textTheme.bodyText1),
                    )),
              ],
            ),
            SizedBox.expand(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(onTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}