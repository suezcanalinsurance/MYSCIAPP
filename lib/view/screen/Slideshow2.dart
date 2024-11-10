import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/Slideshow2.dart';


class SlideshowWidget extends StatelessWidget {
  final Slideshow2Controller controller = Get.put(Slideshow2Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slideshow')),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                controller.updateIndex(index); // Update the index in the controller
              },
              itemCount: controller.imageAssets.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      controller.imageAssets[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          GetBuilder<Slideshow2Controller>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.imageAssets.length,
                        (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: controller.currentIndex == index
                            ? Colors.orange // Active color
                            : Colors.grey, // Inactive color
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
