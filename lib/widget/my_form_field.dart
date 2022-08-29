import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  MyFormField(
      {this.name,
      this.label,
      this.pref,
      this.suff,
      this.isSecured,
      this.validate,
      this.inputType,
      this.controller});
  String? label, name;
  Widget? pref, suff;
  bool? isSecured;
  String? Function(String?)? validate;
  TextInputType? inputType;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: TextFormField(
          controller: controller,
          keyboardType: inputType,
          validator: validate,
          obscureText: isSecured!,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label!,
            prefixIcon: pref!,
            suffixIcon: suff,
          ),
        ),
      ),
    );
  }
}
