import 'package:festi/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryOption extends StatelessWidget {

  final String title;
  final String subtitle;
  final String image;
  final int mount;
  final String restaurant;

  CategoryOption({this.title, this.subtitle, this.mount, this.image, this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 56),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(color: Colors.black38, offset: Offset(0, 8), blurRadius: 13)
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.title, style: TextStyle(fontSize: 24, color: ColorsFesti.AzulFesti,),overflow: TextOverflow.ellipsis,maxLines: 1,),
                      Text(this.subtitle,
                          style: TextStyle(
                              fontSize: 14, color: ColorsFesti.GrisFesti
                          ),
                          overflow: TextOverflow.ellipsis,maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: ColorsFesti.GrisFesti.withOpacity(0.4), blurRadius: 4)],
                    image: DecorationImage(image: NetworkImage(this.image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(14)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () => Navigator.pushNamed(context, "/productPage"),
                  child: Container(
                    width:60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: ColorsFesti.AzulFesti,
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.keyboard_arrow_right_sharp, color: Colors.white,),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}