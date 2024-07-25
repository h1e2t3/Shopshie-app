import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/Get_controller.dart';
import '../../Model/Clothes.model.dart';
import 'add_to_cart_screen.dart';

class InProductScreen extends StatelessWidget {
  final ClothingItem item;
  final CartController cartController = Get.put(CartController());
   InProductScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Shopsie',
          style: GoogleFonts.playfairDisplay(
            color: Color(0xff5F6AFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height / 2,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    blurStyle: BlurStyle.normal,
                    blurRadius: 12,
                  ),
                ],
                image: DecorationImage(
                    image: NetworkImage(
                      item.image.toString()),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
               item.name,
                style: GoogleFonts.lato(
                  color: Color(0xff222326), //black color
                  fontSize: 24,
                ),
              ),
            ),
            Text(
              "\$ " + item.price.toString(),
              style: GoogleFonts.lato(
                color: Color(0xff5F6AFF),
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
              item.details,
                style: GoogleFonts.lato(
                  color: Color(0xff222326), //black color
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              width: Get.width,
              child: CupertinoButton(
                  color: Color(0xff5F6AFF),
                  onPressed: () {
                    cartController.addToCart(item);
                    Get.to(AddToCartScreen());
                  },
                  child: Text(
                    "ADD TO CART",
                    style: GoogleFonts.lato(
                      color: Color(0xffffffff),
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
