import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
class Quantityaddbutton extends StatefulWidget {
  const Quantityaddbutton({super.key});

  @override
  State<Quantityaddbutton> createState() => _QuantityaddbuttonState();
}

class _QuantityaddbuttonState extends State<Quantityaddbutton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Get.height/10,
          width: Get.width/7,
          color: Colors.red,
        )
      ],
    );
  }
}
