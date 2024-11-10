import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 70,
        backgroundColor: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
              AppImageAsset.logo,
            ),
          ),
        ));
  }
}

class NewLogoAuth extends StatelessWidget {
  const NewLogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(0), // Border radius
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the image width and height based on available space
          double imageWidth = constraints.maxWidth * 0.5; // Adjust the multiplier (0.5) as needed for responsiveness

          return Image.asset(
            AppImageAsset.newlogo,
            width: imageWidth, // Make image responsive
            height: imageWidth, // Keep it proportional by using the same value for width and height
            fit: BoxFit.contain, // Adjust how the image fits within its container
          );
        },
      ),
    );

  }
}
