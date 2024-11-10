import 'package:get/get.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';

class Slideshow2Controller extends GetxController {
  // List of image assets
  final List<String> imageAssets = [
    AppImageAsset.slidshow5
    // Add more images as needed
  ];

  // Current index of the displayed image
  var currentIndex = 0;

  // Method to update the current index
  void updateIndex(int index) {
    currentIndex = index;
    update(); // Call update() to refresh the UI
  }
}
