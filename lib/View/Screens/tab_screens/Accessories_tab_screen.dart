import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopsie/View/Screens/In_product_Screen.dart';

import '../../../../Model/Clothes.model.dart';
class Accessoriestab extends StatefulWidget {
     Accessoriestab({super.key});
  @override

     State<Accessoriestab> createState() => _AccessoriestabState();
}

class _AccessoriestabState extends State<Accessoriestab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height:300, // Specify the height you want for the list
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: accessories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Get.to(InProductScreen(item:accessories[index]));
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
                              image: DecorationImage(image:NetworkImage(accessories[index].image.toString()),fit:BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(accessories[index].name,style:GoogleFonts.lato(
                          color: Color(0xff222326),//black color
                          fontSize:18,
                        ),),
                        Text("\$ "+accessories[index].price.toString(),style:GoogleFonts.lato(
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