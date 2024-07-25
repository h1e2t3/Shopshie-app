import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Controller/Get_controller.dart';
import '../../../../Model/Clothes.model.dart';

class HomeinProductScreen extends StatefulWidget {
  const HomeinProductScreen({super.key, required this.item});
  final List<ClothingItem> item;

  @override
  State<HomeinProductScreen> createState() => _HomeinProductScreenState();
}

class _HomeinProductScreenState extends State<HomeinProductScreen> {
  final HomeController controller = Get.put(HomeController());
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
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
                    image: NetworkImage(widget.item[selectedindex].image.toString()),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text(widget.item[selectedindex].name,style:GoogleFonts.lato(
                color: Color(0xff222326),//black color
                fontSize:24,
              ),),
            ),
            Text("\$ "+widget.item[selectedindex].price.toString(),style:GoogleFonts.lato(
              color:Color(0xff5F6AFF),
              fontSize:20,
            ),),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text(widget.item[selectedindex].details,style:GoogleFonts.lato(
                color: Color(0xff222326),//black color
                fontSize:18,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

