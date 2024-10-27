import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.onSubmitted,
      this.maxLines = 1,
      this.hintText,
      this.controller,
      this.onChanged,
      this.onSaved});
  final int maxLines;
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is Required';
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        // hintStyle: TextStyle(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      maxLines: maxLines,
      textAlign: TextAlign.center,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }
}
