import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Model/Clothes.model.dart';
import '../In_product_Screen.dart';

class Alltab extends StatefulWidget {
  const Alltab({super.key});

  @override
  State<Alltab> createState() => _AlltabState();
}

class _AlltabState extends State<Alltab> {
  int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height:300, // Specify the height you want for the list
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap:(){
                  setState(() {
                    selectedindex=index;
                  });
                  Get.to(InProductScreen(item:items[index],));
                  print(items);
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
                        image: DecorationImage(image:NetworkImage(items[index].image.toString()),fit:BoxFit.cover)
                      ),
                    ),
                      SizedBox(height: 5,),
                      Text(items[index].name,style:GoogleFonts.lato(
                        color: Color(0xff222326),//black color
                        fontSize:18,
                      ),),
                      Text("\$ "+items[index].price.toString(),style:GoogleFonts.lato(
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
