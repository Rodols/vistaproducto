import 'package:festi/screens/authentication/widgets/login_custom_paint.dart';
import 'package:festi/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFesti.BeigeFesti,
      body: Stack(
        children: <Widget> [
          Positioned(
            top: 190.0,
            child: BackLayer(colorLayer: ColorsFesti.AmarilloFesti,heightLayer: 400.0),
            width: MediaQuery.of(context).size.width,
          ),Positioned(
            top: 0.0,
              child: BackLayer(colorLayer: ColorsFesti.AzulFesti,heightLayer: 220.0),
                width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 80,
            left: 95,
            child: CircleProduct(),
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 190.0,
            right: 110.0,
            child: ComentsButton(),
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 310.0,
            child: ProductCont(),
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 390.0,
            child: TextProduct(),
            width: MediaQuery.of(context).size.width,
            height: 200,
          ),
          Positioned(
            top: 50.0,
            left: 20,
            child: ButtonArrow(),
            width: MediaQuery.of(context).size.width,
            height: 200,
          ),
        ]
      ),
    );
  }
}

//Widget of layers backgrouds
class BackLayer extends StatelessWidget{
  final colorLayer;
  final heightLayer;

  const BackLayer({Key key, this.colorLayer,this.heightLayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: this.heightLayer,
      decoration: BoxDecoration(
        color: this.colorLayer,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35.0), bottomRight: Radius.circular(35.0)),
      ),
    );
  }
}

class CircleProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: CircleAvatar(
        backgroundColor: ColorsFesti.BlancoFesti,
        radius: 125,
        backgroundImage: NetworkImage('https://coca-colafemsa.com/wp-content/uploads/2020/02/3-55.png'),
      ),
    );
  }
}

//Buttton arrow
class ButtonArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
     child: IconButton(
       alignment: Alignment.topLeft,
       icon: Icon(Icons.arrow_back, color: ColorsFesti.BlancoFesti),
       iconSize: 45.0,
       onPressed: () {
         Navigator.of(context).pop();
       },
     ),
   );
  }
}


//Button to add comments widget
class ButtonComent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: FloatingActionButton(
            onPressed: (){

            },
          child: Icon(Icons.message,color: ColorsFesti.GrisFesti,),
          backgroundColor: ColorsFesti.BlancoFesti,
      ),
    );
  }
}

//Product counter widget
class ProductCont extends StatefulWidget {
  @override
  _ProductContState createState() => _ProductContState();
}

class _ProductContState extends State<ProductCont> {
  int _piezas = 0;

  void _incrementPiezas() {
    setState(() {
      _piezas++;
    });
  }

  void _decrementPiezas() {
    setState(() {
      if(_piezas > 0){
        _piezas--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 45),
      child: Row(
        children: [
          Container(
              width: 40.0,
              child:RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0),topLeft: Radius.circular(15.0)),
                ),
                color: ColorsFesti.BlancoFesti,
                padding: const EdgeInsets.all(1.0),
                onPressed: (){
                  _decrementPiezas();
                },
                child: Text(
                  '-',
                  style: TextStyle(
                      fontSize: 25,
                      color: ColorsFesti.GrisFesti
                  ),
                ),
              )
          ),
          Container(
            width: 60.0,
            height: 35.0,
            alignment: Alignment.center,
            color: ColorsFesti.BlancoFesti,
            child:  Text(
              this._piezas.toString(),
              style: TextStyle
                (
                fontSize: 20,
                color: ColorsFesti.GrisFesti,
              ),
            ),
          ),
          Container(
            width: 40.0,
            child:   RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0),topRight: Radius.circular(15.0))
              ),
              color: ColorsFesti.BlancoFesti,
              padding: const EdgeInsets.all(1.0),
              onPressed: (){
                _incrementPiezas();
              },
              child: Text(
                '+',
                style: TextStyle(
                    fontSize: 25,
                    color: ColorsFesti.GrisFesti,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


//Product widget actions
class TextProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(left: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Coca Cola',
              style: TextStyle(
                fontSize: 35.0,
              ),
            ),
          ),
          Container(
            width: 250.0,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Ideal para cuando se te antoja un refresco!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: ColorsFesti.GrisFesti
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                 Text(
                  '\$10',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              Container(
                width: 150.0,
                child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  color: ColorsFesti.NaranjaFesti,
                  padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Ordenar',
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorsFesti.BlancoFesti,
                      ),
                    ),
                    onPressed: () => print('Hola'),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}

//Show dialog
class ComentsButton extends StatefulWidget {

  @override
  _ComentsButtonState createState() => _ComentsButtonState();
}

class _ComentsButtonState extends State<ComentsButton> {
TextEditingController _textFieldController = TextEditingController();
  void _showcontent() {
    showDialog(context: context, barrierDismissible: false,

      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text('¿Agregar un comentario?'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: 'Escribe tu comentario'),
            ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCEL'),
            ),
            FlatButton(
              child: Text('OK'),
                onPressed: (){
                Navigator.pop(context);
                }
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: FloatingActionButton(
        onPressed:  _showcontent,
        child: Icon(Icons.message, color: ColorsFesti.GrisFesti,),
        backgroundColor: ColorsFesti.BlancoFesti,
      ),
    );
  }
}
