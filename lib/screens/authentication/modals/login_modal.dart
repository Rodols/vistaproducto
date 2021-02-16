import 'package:festi/providers/authentication_provider.dart';
import 'package:festi/screens/authentication/modals/signup_modal.dart';
import 'package:festi/utils/colors.dart';
import 'package:festi/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginModal {

  void loginModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: _modalLoginBody(context),
          decoration: BoxDecoration(
            color: ColorsFesti.AzulFesti,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(60),
            ),
          ),
        ),
      ),
    );
  }

  _modalLoginBody(BuildContext context) {
    AuthProvider provider = Provider.of<AuthProvider>(context, listen: true);


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 325),
          child: FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 60, left: 60),
          child: Form(
            key: provider.signInKey,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Iniciar\nSesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextInputComponent(
                  placeholder: "Correo",
                  controller: provider.emailController,
                  icon: Icons.email_sharp,
                  validator: (text){
                    if(text.trim().isEmpty) return "Tú correo no puede ser vacio";
                    if(text.length < 3) return "Tú correo es muy corto!";
                    if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text)) return "El correo es incorrecto, verificalo";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextInputComponent(
                  placeholder: "Contraseña",
                  controller: provider.passwordController,
                  icon: Icons.security_sharp,
                  validator: (text){
                    if(text.trim().isEmpty) return "Tú contraseña no puede ser vacio";
                    if(text.length < 7) return "Tú contraseña es muy corto!";
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 200),
          child: ButtonTheme(
            minWidth: 80.0,
            height: 50.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: RaisedButton(
                child: Icon(
                  Icons.arrow_right_alt_outlined,
                  size: 35.0,
                ),
                color: ColorsFesti.AmarilloFesti,
                onPressed: () {
                  if (provider.signInKey.currentState.validate()) {
                    provider.signInKey.currentState.save();
                  }
                  Navigator.popAndPushNamed(context, '/restaurant');
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        FlatButton(
          child: Text(
            '¿No tienes una cuenta? Crea una',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            SignUpModal().signUpModal(context);
          },
        ),
      ],
    );
  }
}