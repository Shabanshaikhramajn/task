import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.colors,
    this.prefixIcon,
    this.borderColor,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPadding,
      this.suffixIcon,
    this.obscureText = false, 
    this.fontWeight,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.filteringTextInputFormatter,
    this.maxLines,
    this.hintStyleFontSize,
    this.hintStyleColor, this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final Color? colors;
  final Icon? prefixIcon;
  final Color? borderColor;
  final double? borderRadius;
   final Widget? suffixIcon;
  final bool obscureText;
  final double? verticalPadding;
  final double? horizontalPadding;
  final FontWeight? fontWeight;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputFormatter? filteringTextInputFormatter;
  final int? maxLines;
  final double? hintStyleFontSize;
  final Color? hintStyleColor;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
         obscureText: obscureText,
         
        controller: controller,
        onChanged: onChanged,
        cursorColor: AppColors.primaryColor,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: obscureText ? 1 : (maxLines ?? 1),
        inputFormatters: filteringTextInputFormatter != null
            ? [filteringTextInputFormatter!]
            : [],
        decoration: InputDecoration(
         suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hint,
          hintStyle: TextStyle(
            color: hintStyleColor ?? Colors.black54,
            fontSize: hintStyleFontSize ?? 20,
            fontWeight: fontWeight ?? FontWeight.w500,
          ),
          fillColor: colors ?? AppColors.lightDarkColor,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 11.0,
              horizontal: horizontalPadding ?? 18.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 11.0),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.lightDarkColor,
              width: 1.2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 11.0),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.lightDarkColor,
              width: 1.2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 11.0),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.lightDarkColor,
              width: 1.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 11.0),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.lightDarkColor,
              width: 1.2,
            ),
          ),
        ),
      
        style: TextStyle(
          fontSize: 18,
        ),
        validator: validator);
  }
}
