import 'package:festi/providers/authentication_provider.dart';
import 'package:festi/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'login_modal.dart';

class SignUpModal {


  void signUpModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: _modalSignUpBody(context),
          decoration: BoxDecoration(
            color: Color(0xFF27383E),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(60),
            ),
          ),
        ),
      ),
    );
  }

  _modalSignUpBody(BuildContext context) {
    AuthProvider provider = Provider.of<AuthProvider>(context, listen: true);

    return Column(
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
            key: provider.signUpKey,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Crear Cuenta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextInputComponent(
                  placeholder: "Nombre",
                  controller: provider.nameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-ZñÑ]"))
                  ],
                  validator: (text){
                    if(text.trim().isEmpty) return "Tú nombre no puede ser vacio";
                    if(text.length < 3) return "Tú nombre es muy corto!";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextInputComponent(
                  placeholder: "Apellido",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-ZñÑ]"))
                  ],
                  controller: provider.lastnameController,
                  validator: (text){
                    if(text.trim().isEmpty) return "Tú apellido no puede ser vacio";
                    if(text.length < 3) return "Tú apellido es muy corto!";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 20,
                ),
                TextInputComponent(
                  placeholder: "Nombre del restaurante",
                  controller: provider.restaurantNameController,
                  icon: Icons.shop_sharp,
                  validator: (text){
                    if(text.trim().isEmpty) return "Necesitamos el nombre de tu restaurante!";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextInputComponent(
                  placeholder: "Tú número de identificación",
                  controller: provider.dniController,
                  icon: Icons.perm_identity_sharp,
                  validator: (text){
                    if(text.trim().isEmpty) return "Necesitamos número de identificación!";
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
        GestureDetector(
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(14)
              ),
              child: Icon(
                Icons.arrow_right_alt_outlined,
                size: 35.0,
              ),
            ),
            onTap: () {
              if (provider.signUpKey.currentState.validate()) {

                //TODO: Envíar petición a firebase

                provider.signUpKey.currentState.reset();
              }
            }
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          child: Text(
            '¿Ya tienes una cuenta? Inicia Sesión',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            LoginModal().loginModal(context);
          },
        ),
      ],
    );
  }
}