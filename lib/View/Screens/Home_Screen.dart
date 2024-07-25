import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopsie/View/Screens/tab_screens/Main_tab_Screen.dart';

import '../../Controller/Get_controller.dart';
import 'Appbar_navigations/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CarouselController carouselController = CarouselController();
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "CART",
                      style: GoogleFonts.lato(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "PROFILE",
                      style: GoogleFonts.lato(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "CLOTHING",
                      style: GoogleFonts.lato(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "SHOES",
                      style: GoogleFonts.lato(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram)),
                IconButton(
                    onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram)),
                IconButton(
                    onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram)),
                IconButton(
                    onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram)),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Shopsie",
          style: GoogleFonts.playfairDisplay(
            color: Color(0xff5F6AFF),
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(CupertinoIcons.search),
          SizedBox(
            width: 12,
          ),
          Icon(CupertinoIcons.shopping_cart),
          SizedBox(
            width: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(icon:Icon(CupertinoIcons.person), onPressed: () {
              Get.to(ProfileScreen());
            }, ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                height: Get.height / 2.6,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.20),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(200),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://i.pinimg.com/736x/c2/b0/c4/c2b0c4ffe0721d213444e9cd04dc6c8f.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "SEASON SALE\n",
                            style: GoogleFonts.playfairDisplay(
                              color: Colors.black54,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "          up to   ",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "60% 0ff",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CupertinoButton(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                color: Colors.grey.withOpacity(0.10),
                child: Text(
                  "Shop",
                  style: GoogleFonts.lato(
                    color: Colors.grey,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 80,
              ),
              SizedBox(height: 550, child: MainTabScreen()),
              Text(
                "Actual Categories",
                style: GoogleFonts.lato(
                  color: Colors.grey,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Container(
                    height: Get.height / 2.3,
                    width: Get.width / 1.2,
                    // color: Colors.grey.withOpacity(0.20),
                    child: Column(
                      children: [
                        Container(
                          height: Get.height / 3,
                          width: Get.width / 1.2,
                          child: CarouselSlider(
                            items: controller.outerwearList
                                .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  e["images"],
                                  fit: BoxFit.fill,
                                  // width: double.infinity,
                                ),
                              ),
                            ))
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                controller.onPageChanged(index, reason);
                              },
                              autoPlay: true,
                              scrollPhysics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: Text(
                            "Outerwear",
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          "Raincoats,Sweaters,etc.",
                          style: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: Get.height / 2.3,
                    width: Get.width / 1.2,
                    // color: Colors.grey.withOpacity(0.20),
                    child: Column(
                      children: [
                        Container(
                          height: Get.height / 3,
                          width: Get.width / 1.2,
                          child: CarouselSlider(
                            items: controller.Leathershoes
                                .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  e["images"],
                                  fit: BoxFit.fill,
                                  // width: double.infinity,
                                ),
                              ),
                            ))
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                controller.onPageChanged(index, reason);
                              },
                              autoPlay: true,
                              scrollPhysics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: Text(
                            "Leather shoes",
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          "Shoes,Sandals,etc.",
                          style: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: Get.height / 2.3,
                    width: Get.width / 1.2,
                    // color: Colors.grey.withOpacity(0.20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            height: Get.height / 3,
                            width: Get.width / 1.2,
                            child: CarouselSlider(
                              items: controller.Lightdresses
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.network(
                                            e["images"],
                                            fit: BoxFit.fill,
                                            // width: double.infinity,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              carouselController: carouselController,
                              options: CarouselOptions(
                                onPageChanged: (index, reason) {
                                  controller.onPageChanged(index, reason);
                                },
                                autoPlay: true,
                                scrollPhysics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: Text(
                            "Light dresses",
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          "Evening,casual,home",
                          style: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
