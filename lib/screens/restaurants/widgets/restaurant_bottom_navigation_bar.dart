import 'package:festi/utils/colors.dart';
import 'package:flutter/material.dart';

class RestaurantTapBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: ColorsFesti.AzulFesti,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(icon: Icon(Icons.home,color: ColorsFesti.BlancoFesti,size: 30), onPressed: () {}),
            SizedBox(width: MediaQuery.of(context).size.width*0.25,),
            IconButton(icon: Icon(Icons.supervised_user_circle,color: ColorsFesti.BlancoFesti, size: 30,), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
