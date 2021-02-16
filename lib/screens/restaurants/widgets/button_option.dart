import 'package:festi/screens/restaurants/administrar_pedidos_page.dart';
import 'package:festi/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonOption extends StatelessWidget {

  final String textoDelBoton;
  final IconData iconoDelBoton; // Se escribe solamente el contenido de Icon() .por ejemplo el contenido de Icon(Icons.menu) es Icons.menu
  //  Si quieres cambiar los colores de los iconos, debes hacerlo por medio de Icon(Icons.menu, color: ColorsFesti.AzulFesti,)
  final colorDelBoton;  // Se usa el formato ColorsFesti.AmarilloFesti por ejemplo
  final colorDelContenido;
  final Widget route;

  ButtonOption({this.textoDelBoton, this.iconoDelBoton, this.colorDelBoton, this.colorDelContenido, this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 300,
              alignment: Alignment.center,
              color: this.colorDelBoton,
              child: RaisedButton(
                color: this.colorDelBoton,
                onPressed: () {Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___) => this.route));},
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(iconoDelBoton, color: this.colorDelContenido,),
                      SizedBox(width: 40,),
                      Text(this.textoDelBoton, style: TextStyle(color: this.colorDelContenido),)
                    ],),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
