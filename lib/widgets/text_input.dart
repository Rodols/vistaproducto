import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputComponent extends StatefulWidget  {

  final String placeholder;
  final IconData icon;
  final TextEditingController controller;
  final Function(String) validator;
  final TextInputType type;
  final List<TextInputFormatter> inputFormatters;
  final bool isPassword;

  const TextInputComponent({Key key, this.placeholder, this.icon, this.controller, this.validator, this.type, this.inputFormatters, this.isPassword = false}) : super(key: key);

  @override
  _TextInputComponentState createState() => _TextInputComponentState();
}

class _TextInputComponentState extends State<TextInputComponent> {

  bool visiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      decoration: InputDecoration(
          labelText: widget.placeholder,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(widget.icon),
          prefixIcon: widget.isPassword ? IconButton(icon: Icon(visiblePassword ? Icons.remove_red_eye : Icons.security), onPressed: () => this.setState(() {this.visiblePassword = !this.visiblePassword;}),) : null
      ),
      obscureText: this.visiblePassword,
      validator: widget.validator,
    );
  }
}