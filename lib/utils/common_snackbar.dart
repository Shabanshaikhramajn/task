import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonSnackbar {
  static void showSnackbar({
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Color? actionTextColor,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    double borderRadius = 12.0,
    TextStyle? textStyle,
    TextStyle? actionTextStyle,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: textStyle ??
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
              fontFamily: 'Manrope',
            ),
      ),
      duration: duration,
      backgroundColor: backgroundColor,
      behavior: behavior,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      action: (actionLabel != null && onAction != null)
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onAction,
              textColor: actionTextColor ?? Colors.white,
            )
          : null,
    );

    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
