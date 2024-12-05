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
  final int? maxLine;
  final bool? obscureText;
  final BorderRadius? borderRadius;
  final Color? borderColor; // Optional border color parameter
  final Color? fillColor; // Optional fill color parameter
  final Color? hintTextColor; // Optional hint text color parameter

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
    this.height,
    this.obscureText,
    this.borderRadius,
    this.borderColor, // Initialize optional borderColor
    this.hintTextColor, // Initialize optional hintTextColor
    this.fillColor, // Initialize optional fillColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height ?? 55,
          child: TextFormField(
            maxLines: maxLine ?? 1,
            minLines: 1,
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintTextColor ?? AppColors.lighyGreyColor1,
                fontFamily: AppFontsFamily.poppins,
              ),
              filled: true,
              fillColor: fillColor ?? AppColors.textFiledColor,
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(25),
                borderSide: BorderSide(
                    color:
                        borderColor ?? Colors.transparent), // Use borderColor
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(25),
                borderSide: BorderSide(
                    color:
                        borderColor ?? Colors.grey[300]!), // Use borderColor
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(25),
                borderSide: BorderSide(
                    color: borderColor ??
                        AppColors.primaryColor), // Use borderColor
              ),
              suffixIcon: suffixIcon,
              suffixIconColor: AppColors.IconColors,
              errorText: errorText,
              prefixIcon: prefixIcon,
              prefixIconColor: AppColors.IconColors,
            ),
          ),
        ),
      ],
    );
  }
}
