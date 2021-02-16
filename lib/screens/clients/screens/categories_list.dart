import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festi/screens/clients/widgets/category_option.dart';
import 'package:festi/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFesti.BeigeFesti,
      body: Stack(
          children: [
            Positioned(
              right: MediaQuery.of(context).size.width - 85,
              bottom: MediaQuery.of(context).size.height - 115,
              child: Container(
                alignment: Alignment.topLeft,
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorsFesti.AmarilloFesti
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16, right: 32, bottom: 16, left: 48),
                    child: Text(
                      'SUSHI CHAN\'S',
                      style: TextStyle(
                        color: ColorsFesti.AzulFesti,
                        fontSize: 55,
                        fontFamily: 'OpenSans-ExtraBold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('titles').snapshots(),
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator(),);
                            }
                            return ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: snapshot.data.docs.map((document) {
                                return Center(child: Container(
                                  child: CategoryOption(
                                    title: document['emoji'],
                                    subtitle: document['subtitle'],
                                    image: document['image'],
                                    mount: 3,
                                    restaurant: 'Hola',
                                  ),),);
                              }).toList()
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width - 165,
              bottom: MediaQuery.of(context).size.height - 125,
              child: Container(
                alignment: Alignment.topLeft,
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorsFesti.NaranjaFesti
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width - 65,
              bottom: MediaQuery.of(context).size.height - 185,
              child: Container(
                alignment: Alignment.topLeft,
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorsFesti.AzulFesti
                ),
              ),
            ),
          ]
      ),
    );
  }
}
