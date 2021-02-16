import 'package:festi/screens/authentication/widgets/login_custom_paint.dart';
import 'package:festi/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modals/login_modal.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7D3),
      body: Stack(overflow: Overflow.visible, children: [
        Container(
          child: CustomPaint(
            painter: CurvePaint(),
            size: MediaQuery.of(context).size,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                'FESTI.',
                style: TextStyle(
                  color: ColorsFesti.AmarilloFesti,
                  fontSize: 70,
                  fontFamily: 'ClearSansBold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height*0.14,
          left: MediaQuery.of(context).size.width*0.75,
          child: Container(
            alignment: Alignment.centerRight,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ColorsFesti.VerdeoscuroFesti),
          ),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width*0.1,
            top: MediaQuery.of(context).size.height*0.25,
            child: Container(
              alignment: Alignment.topRight,
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: ColorsFesti.NaranjaFesti),
            )),
        Positioned(
            left: MediaQuery.of(context).size.width*0.2,
            top: MediaQuery.of(context).size.height*0.12,
            child: Container(
              alignment: Alignment.topLeft,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF5B5A5A)),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 1.2,
              child: Image.asset(
                'assets/images/FirstPageIcon.png',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 110),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              color: ColorsFesti.AzulFesti,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                Navigator.pushNamed(context, "/scanner");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Image.asset(
                    'assets/images/qr-code-512.png',
                    width: 45,
                    height: 45,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text(
                'Iniciar sesion como restaurante',
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    decoration: TextDecoration.underline,
                    color: ColorsFesti.AzulFesti),
              ),
              onPressed: () => LoginModal().loginModal(context),
            ),
          ),
        ),
      ]),
    );
  }
}
