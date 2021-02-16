import 'package:festi/utils/colors.dart';
import 'package:flutter/material.dart';

// Tienes que definir floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked en Scaffold()

class QrButtonCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsFesti.AmarilloFesti,
      onPressed: () {},
      child: Icon(Icons.add, color: ColorsFesti.AzulFesti,),
      elevation: 2.0,
    );
  }
}
