import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CustomActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Replace with your actual controller instance

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('MY SCI'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Choose your color
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Call'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                FlutterPhoneDirectCaller.callNumber('16569');
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                final double screenWidth = MediaQuery.of(context).size.width;

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
                                  'assets/en.png', // Replace with your image asset path
                                  width: 20,
                                ),
                              ),
                              title: Text(
                                "English (إنجليزي)",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                ),
                              ),

                            ),
                            ListTile(
                              leading: ClipOval(
                                child: Image.asset(
                                  'assets/ar.png', // Replace with your image asset path
                                  width: 20,
                                ),
                              ),
                              title: Text(
                                "Arabic (عربي)",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Content goes here'),
      ),
    );
  }
}
