import 'package:festi/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MesaOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool statusIcon;

  MesaOption({this.title, this.image, this.subtitle, this.statusIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 340,
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      ColorsFesti.GrisFesti.withOpacity(0.25),
                                  blurRadius: 5,
                                  spreadRadius: 1)
                            ],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(this.image),
                              fit: BoxFit.cover,
                            ))),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20, color: ColorsFesti.AzulFesti),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(color: ColorsFesti.GrisFesti),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                if (statusIcon == true)
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.warning,
                        color: ColorsFesti.RojoFesti,
                        size: 30,
                      ))
                else
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.check_circle,
                        color: ColorsFesti.VerdeClaroFesti,
                        size: 30,
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  MenuOption({this.title, this.image, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {},
        child: Container(
          width: 340,
          alignment: Alignment.center,
          child: RaisedButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 17),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        ColorsFesti.GrisFesti.withOpacity(0.25),
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(this.image),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 20, color: ColorsFesti.AzulFesti),
                        ),
                        Container(
                            width: 150,
                            child: Text(
                              subtitle,
                              style: TextStyle(color: ColorsFesti.GrisFesti),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle,
                            color: ColorsFesti.RojoFesti,
                            size: 35,
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: 330,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: ColorsFesti.GrisFesti,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AddCategoryModal();
                });
          },
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  'Agregar categoría',
                  style: TextStyle(color: ColorsFesti.BlancoFesti),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddCategoryModal extends StatelessWidget {
  final String tituloDelBoton;
  final IconData iconoDelBoton;

  const AddCategoryModal({Key key, this.tituloDelBoton, this.iconoDelBoton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorsFesti.AzulFesti,
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: ColorsFesti.AzulFesti, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: ColorsFesti.RojoFesti, shape: BoxShape.circle, image: DecorationImage(image: NetworkImage('https://www.cocacoladechile.cl/content/dam/journey/cl/es/private/productos/lead-product-shots/coca-cola-sin-azucar-598x336.png'), fit: BoxFit.cover))
                  ),
                )),
            Positioned(
              top: 40,
              right: 20,
              child: FlatButton(
                minWidth: 10,
                  onPressed: () {Navigator.pop(context);},
                  child: Icon(Icons.close_rounded, color: ColorsFesti.GrisFesti,)),
            ),
            Positioned(
              top: 95,
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsFesti.GrisFesti),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: 'Nombre de la categoría',
                              hintStyle: TextStyle(
                                  fontSize: 12, color: CupertinoColors.extraLightBackgroundGray,),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 13))),
                    )),
              ),
            ),
            Positioned(
              top: 165,
              child: RaisedButton(
                padding: EdgeInsets.zero,
                color: ColorsFesti.NaranjaFesti,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 20,
                          color: ColorsFesti.BlancoFesti,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Agregar Categoría',
                          style: TextStyle(color: ColorsFesti.BlancoFesti),
                        )
                      ]),
                ),
              ),
            ),
          ],
        ));
  }
}
