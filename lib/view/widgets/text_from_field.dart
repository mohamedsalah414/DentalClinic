import 'package:flutter/material.dart';

class TextFromField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final Widget prefixIcon;
  final String hintText;
  final TextInputType keyboardType;
  const TextFromField(
      {Key? key,
        required this.controller,
        required this.validator,
        required this.prefixIcon,
        required this.hintText, required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),

    );
  }
}
