import 'dart:ffi';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Model/Clothes.model.dart';

class LoginController extends GetxController{
  final Firstname= TextEditingController().obs;
  final Lastname= TextEditingController().obs;
  var  Email= TextEditingController().obs;
  final Password= TextEditingController().obs;

  bool validateCredentials(String email, String password) {
    if (email == Email.toString() && password == Password.toString()) {
      return true;
    }
    return false;
  }

}

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var outerwearList = [].obs;
  var Leathershoes=[].obs;
  var Lightdresses=[].obs;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
    //String reasonString = reason.toString().split('.').last;
    // print('Page changed: Index $index, Reason: $reasonString');
  }

  @override
  void onInit() {
    super.onInit();
    // Simulated data initialization (replace with actual data loading)
    outerwearList.assignAll([
      {"images":"https://assets.ajio.com/medias/sys_master/root/20231123/ZFJH/655f7364afa4cf41f59acab3/-473Wx593H-469559641-olive-MODEL5.jpg"},
      {"images":"https://assets.ajio.com/medias/sys_master/root/20240629/Zhhz/667f8f761d763220fa7ed1b1/-288Wx360H-465324816-tan-MODEL.jpg"},
      {"images":"https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/23029808/2023/11/28/d271a7f1-b1f4-4a4c-bef6-116565e36b231701154647925-HRX-by-Hrithik-Roshan-Men-Jackets-4301701154647555-1.jpg"} ,
    ]);
    Leathershoes.assignAll([
      {"images":"https://teakwoodleathers.com/cdn/shop/products/T_SH_PH_04_CA_1_1080x.jpg?v=1661597996"},
      {"images":"https://assets.ajio.com/medias/sys_master/root/20211118/Ctty/619560d0aeb2690110caab87/-473Wx593H-460991618-coffee-MODEL.jpg"},
      {"images":"https://rukminim2.flixcart.com/image/850/1000/xif0q/shoe/2/h/e/9-fc-6155-tan-09-9-field-care-tan-original-imagqd5qkvnbvfnv.jpeg?q=90&crop=false"} ,
    ]);
    Lightdresses.assignAll([
      {"images":"https://rukminim2.flixcart.com/image/850/1000/kflftzk0/dress/a/r/w/m-fid-15-l-gr-new-inna-original-imafwyshqbz5gwkm.jpeg?q=90&crop=false"},
      {"images":"https://www.jiomart.com/images/product/original/rvk8hkhqxt/preego-women-a-line-light-green-dress-product-images-rvk8hkhqxt-0-202301091514.jpg?im=Resize=(500,630)"},
      {"images":"https://www.jiomart.com/images/product/original/rvavpevp1g/buynewtrend-light-blue-georgette-floral-print-smocked-women-midi-dress-product-images-rvavpevp1g-3-202303041932.jpg?im=Resize=(500,630)"} ,
    ]);

  }

}
class CartController extends GetxController {
  var cartItems = <ClothingItem>[].obs;

  void addToCart(ClothingItem item) {
    cartItems.add(item);

  }
  void removeItem (ClothingItem item ){
      cartItems.remove(item);
  }
}
class CartItem {
  final String name;
  final String image;
  final double price;

  CartItem({required this.name, required this.image, required this.price});
}

