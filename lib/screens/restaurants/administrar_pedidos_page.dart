import 'package:flutter/material.dart';
import 'package:festi/utils/colors.dart';
import 'package:festi/screens/restaurants/widgets/restaurant_bottom_navigation_bar.dart';
import 'package:festi/screens/restaurants/widgets/create_qr_button.dart';
import 'package:festi/screens/restaurants/widgets/admin_options.dart';

class AdminPedidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsFesti.BeigeFesti,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: ColorsFesti.AzulFesti,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 250,),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications,
                          color: ColorsFesti.AzulFesti,
                          size: 30,
                        ))
                  ],),
              ),
              MesaOption(
                title: 'Hola',
                statusIcon: true,
                subtitle: 'Hola',
                image: 'https://eadn-wc03-196922.nxedge.io/cdn/wp-content/uploads/2018/10/young-attractive-woman.jpg',
              ),
              MesaOption(
                title: 'chao',
                statusIcon: false,
                subtitle: 'chao',
                image: 'https://eadn-wc03-196922.nxedge.io/cdn/wp-content/uploads/2018/10/young-attractive-woman.jpg',
              ),
            ],),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: QrButtonCreator(),
      bottomNavigationBar: RestaurantTapBar(),
    );
  }
}
