import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/container_button_model.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key}) {}

  @override
  Widget build(BuildContext context) {
    Color? textFieldIconColor = const Color(0XFFb3b3b3);
    const verticalSpace = 0.010;
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.secondaryColor,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Get.to(OTPScreen());
        //   },
        // ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * .2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Reset Password",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .2),
                Divider(
                  color: textFieldIconColor,
                ),
                SizedBox(height: Get.height * .2),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                ),
                ContainerButtonModel(
                    containerHieght: 50,
                    textColor: AppColors.whiteColor,
                    bgColor: AppColors.primaryColor,
                    itext: 'Reset',
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
