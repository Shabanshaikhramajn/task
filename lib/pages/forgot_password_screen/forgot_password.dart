import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/container_button_model.dart';
import 'package:task/utils/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key}) {}
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color? textFieldIconColor = const Color(0XFFb3b3b3);
    const verticalSpace = 0.010;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 6,
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new, 
            color: Colors.white, 
            size: 24, 
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          child: Form(
            child: Column(
              children: [
                SizedBox(height: Get.height * .02),
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
                SizedBox(height: Get.height * .04),
                CustomTextFormField(
                  controller: controller,
                  hint: "Enter Email",
                  hintStyleFontSize: 15,
                  borderColor: Colors.grey,
                  colors: AppColors.transparentColor,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: Get.height * .04),
                ContainerButtonModel(
                    containerHieght: 50,
                    borderRadius: BorderRadius.circular(8),
                    textColor: AppColors.whiteColor,
                    bgColor: AppColors.primaryColor,
                    itext: 'Reset',
                    fontweight: FontWeight.normal,
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
