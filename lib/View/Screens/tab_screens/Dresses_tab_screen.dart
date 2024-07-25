import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Model/Clothes.model.dart';
import '../In_product_Screen.dart';
class Dressestab extends StatefulWidget {
  const Dressestab({super.key});

  @override
  State<Dressestab> createState() => _DressestabState();
}

class _DressestabState extends State<Dressestab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height:300, // Specify the height you want for the list
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: dresses.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap:(){
                  Get.to(InProductScreen(item: dresses[index],));
                },
                child: Container(
                    width:200,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(12)
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:Get.height/4.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(image:NetworkImage(dresses[index].image.toString()),fit:BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(dresses[index].name,style:GoogleFonts.lato(
                          color: Color(0xff222326),//black color
                          fontSize:18,
                        ),),
                        Text("\$ "+dresses[index].price.toString(),style:GoogleFonts.lato(
                          color:Color(0xff5F6AFF),
                          fontSize:14,
                        ),),
                      ],)// Display item details
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
