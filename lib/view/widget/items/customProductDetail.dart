import 'package:suezproduction/data/model/items_model.dart';
import 'package:flutter/material.dart';

class CustomProductDetail extends StatelessWidget {
 final itemsmodel item_model;
  const CustomProductDetail({Key? key, required this.item_model}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      Text(item_model.itemsName!)
    ],);
  }
}
