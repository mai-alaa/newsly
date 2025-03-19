import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFeiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? prefix;
  final IconData? suffix;
  final VoidCallback? suffixOnPressed;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final bool isPassword;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final bool readOnly; 
  final String text;

  const CustomTextFormFeiled({
    super.key,
    required this.text,
    required this.controller,
    this.validator,
    this.prefix,
    this.suffix,
    this.inputFormatter,
    this.suffixOnPressed,
    this.keyboardType,
    this.onChanged,
    this.onSubmit,
    this.isPassword = false,
    this.focusNode,
    this.onTap,
    this.readOnly = false, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      focusNode: focusNode,
      obscureText: isPassword,
      inputFormatters: inputFormatter,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text, 
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      readOnly: readOnly, 
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        prefixIcon: Icon(prefix, color: Colors.grey),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixOnPressed,
                color: Colors.grey,
              )
            : null,
        fillColor: const Color(0xFFF5F6F8),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.grey[600]),
    );
  }
}