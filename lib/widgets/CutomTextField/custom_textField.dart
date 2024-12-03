import 'package:flutter/material.dart';
import '../../services/constants/constants.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? errorText;
  final Widget? prefixIcon;
  final bool? isNavigate;
  final Function(String)? onChanged;
  final double? height;
  final int? maxLine; // Optional height parameter
  final bool? obscureText; // Optional obscureText parameter

  CustomField({
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    required this.validator,
    this.maxLine,
    this.errorText,
    this.prefixIcon,
    this.isNavigate,
    this.onChanged,
    this.height, // Optional height parameter
    this.obscureText, // Optional obscureText parameter
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // color: Colors.red,
          height: height ?? 55, // Use the height parameter if provided
          child: TextFormField(
            maxLines: maxLine ?? 1,
            minLines: 1,
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscureText: obscureText ?? false, // Default to false if not provided
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.lighyGreyColor1, fontFamily: AppFontsFamily.poppins),
                filled: true,
                fillColor: AppColors.textFiledColor,
                // Default border is transparent (no visible border)
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none, // No border by default
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.primaryColor), // Visible border when focused
                ),
                suffixIcon: suffixIcon,
                suffixIconColor: AppColors.IconColors,
                errorText: errorText,
                prefixIcon: prefixIcon,
                prefixIconColor: AppColors.IconColors
            ),
          ),
        ),
      ],
    );
  }
}
