import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart'; // Make sure you import this package
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/localization/changelocal.dart';



class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  LocaleController  localcontroller;  // Replace this with your actual local controller class

  MainAppBar({required this.title, required this.localcontroller});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.call),
          onPressed: () {
            FlutterPhoneDirectCaller.callNumber('16569');
          },
        ),
        IconButton(
          icon: Icon(Icons.language),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: ClipOval(
                            child: Image.asset(
                              AppImageAsset.en,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "English (إنجليزي)",
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                            ),
                          ),
                          onTap: () {
                            localcontroller.changeLang("en");
                            Navigator.pop(context); // Close the modal after selecting
                          },
                        ),
                        ListTile(
                          leading: ClipOval(
                            child: Image.asset(
                              AppImageAsset.ar,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "Arabic (عربي)",
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                            ),
                          ),
                          onTap: () {
                            localcontroller.changeLang("ar");
                            Navigator.pop(context); // Close the modal after selecting
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
