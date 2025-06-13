import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/app_colors.dart';

class CircularLoader extends GetxController {
  static final RxBool isLoading = false.obs;

  static void show() {
    if (!isLoading.value) {
      isLoading.value = true;

      Get.dialog(
        Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.1),
            ),

            // Centered loader
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                strokeWidth: 5,
              ),
            ),
          ],
        ),
        barrierDismissible: false,
        useSafeArea: false,
      );
    }
  }

  static void hide() {
    if (isLoading.value) {
      isLoading.value = false;
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    }
  }
}
