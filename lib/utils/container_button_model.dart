import 'package:flutter/material.dart';
import 'package:task/utils/app_colors.dart';

class ContainerButtonModel extends StatelessWidget {
  final Color? bgColor;

  final double? containerWidth;

  final String? itext;
  final VoidCallback onPressed;
  final double? containerHieght;
  final double? textSize;
  final FontWeight? fontweight;
  final BorderRadius? borderRadius;
  final bool? isLoading;
  final Color? borderColor;
  final Color? textColor;
  final double? blurOpacity;
  final IconData? icon;

  const ContainerButtonModel(
      {super.key,
      this.bgColor,
      this.icon,
      this.containerWidth,
      this.itext,
      required this.onPressed,
      this.blurOpacity,
      this.containerHieght,
      this.textSize,
      this.fontweight,
      this.borderRadius,
      this.isLoading,
      this.borderColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHieght ?? 60,
      width: containerWidth ?? double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(blurOpacity ?? 0), // Soft shadow
            blurRadius: 8,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              foregroundColor: AppColors.whiteColor,
              backgroundColor: bgColor ?? AppColors.primaryColor,
              side: BorderSide(
                  color: borderColor ?? Colors.transparent, width: 1),
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(11))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 24,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
              ],
              Center(
                child: isLoading ?? false
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        '$itext',
                        style: TextStyle(
                            color: textColor ?? Colors.white,
                            fontWeight: fontweight ?? FontWeight.w700,
                            fontSize: textSize ?? 22,
                          ),
                      ),
              ),
            ],
          )),
    );
  }
}

