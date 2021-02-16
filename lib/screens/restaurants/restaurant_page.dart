import 'package:festi/screens/clients/screens/product_page.dart';
import 'package:festi/screens/restaurants/administrar_menu_page.dart';
import 'package:festi/screens/restaurants/administrar_pedidos_page.dart';
import 'package:festi/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:festi/screens/restaurants/widgets/button_option.dart';
import 'package:festi/screens/restaurants/widgets/restaurant_bottom_navigation_bar.dart';
import 'package:festi/screens/restaurants/widgets/create_qr_button.dart';

class RestaurantPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    dynamic args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: ColorsFesti.BeigeFesti,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                IconButton(icon: Icon(Icons.menu, size: 30,), onPressed: () {},),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.625,),
                IconButton(icon: Icon(Icons.notifications, size: 30,), onPressed: () {})
              ],),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hola Li Ying!", style: TextStyle(fontSize: 30,color: ColorsFesti.GrisFesti),),
                    Text('¿Qué quieres hacer hoy?', style: TextStyle(fontSize: 30),),
              ],),
              ),
            ),
            SizedBox(height: 10,),
            Transform.scale(scale: 0.87 ,child: Image.asset('assets/images/restaurant_icon.png',alignment: Alignment.center,)),
            SizedBox(height: 40,),
            Column(
              children: [
                ButtonOption(
                  route: AdminPedidos(),
                  colorDelBoton: ColorsFesti.AmarilloFesti,
                  iconoDelBoton: CupertinoIcons.doc_on_clipboard,
                  textoDelBoton: 'Administrar pedidos',
                  colorDelContenido: ColorsFesti.AzulFesti,
                ),
                Divider(
                  indent: 40,
                  endIndent: 40,
                  color: ColorsFesti.GrisFesti,
                ),
                ButtonOption(
                  route: AdminMenu(),
                  colorDelContenido: ColorsFesti.BlancoFesti,
                  colorDelBoton: ColorsFesti.NaranjaFesti,
                  iconoDelBoton: Icons.restaurant_menu,
                  textoDelBoton: 'Administrar menú'),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: QrButtonCreator(),
      bottomNavigationBar: RestaurantTapBar(),
    );
  }
}