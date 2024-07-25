import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Controller/Get_controller.dart';
class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height:Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:  Obx(() {
          if (cartController.cartItems.isEmpty) {
            return Center(child: Text('No items in the cart'));
          }
          return Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartController.cartItems[index];
                return
                  ListTile(
                  leading: Image.network(
                    item.image,
                    fit: BoxFit.fill,
                    width: 50,
                    height:50,
                  ),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price}'),
                                  );
              },
            ),
          );
        }),
      ),
    );
  }
}
