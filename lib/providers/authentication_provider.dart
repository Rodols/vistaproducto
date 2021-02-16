import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier{

  GlobalKey<FormState> signInKey = GlobalKey();
  GlobalKey<FormState> signUpKey = GlobalKey();
  TextEditingController restaurantNameController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dniController = TextEditingController();

  notify(){
    this.notifyListeners();
  }

}