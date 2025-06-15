import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/controller/login_controller/login_controller.dart';
import 'package:task/pages/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:task/pages/check_rates_screen/check_rates_screen.dart';
import 'package:task/res/routes/getx_route_names.dart';
import 'package:task/utils/App_assets.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_strings.dart';
import 'package:task/utils/common_snackbar.dart';
import 'package:task/utils/container_button_model.dart';
import 'package:task/utils/custom_text_form_field.dart';
import 'package:task/utils/text_style.dart';
import 'package:task/utils/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: Column(
                        children: [
                          verticalSpace(Get.height * 0.08),
                          Image.asset(
                            AppAssets.logoImg,
                            // fit: BoxFit.contain
                            height: 70,
                            width: 200,
                          ),
                          verticalSpace(Get.height * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppStrings.loginheading,
                              style: AppTextStyles.headline1,
                            ),
                          ),
                          verticalSpace(4),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppStrings.loginSubtitle,
                              style: AppTextStyles.headline2,
                            ),
                          ),
                          verticalSpace(Get.height * 0.01),
                          Divider(color: AppColors.textFieldIconColor),
                          verticalSpace(Get.height * 0.023),
                          CustomTextFormField(
                            verticalPadding: 15,
                            hintStyleFontSize: 16,
                            borderColor: AppColors.transparentColor,
                            borderRadius: 8,
                            colors: AppColors.whiteColor,
                            controller: loginController.emailController,
                            hint: "Enter Email",
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Email is required';
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          verticalSpace(Get.height * 0.023),
                          Obx(
                            () => CustomTextFormField(
                              verticalPadding: 15,
                              hintStyleFontSize: 16,
                              borderColor: AppColors.transparentColor,
                              borderRadius: 8,
                              colors: AppColors.whiteColor,
                              controller: loginController.passwordController,
                              hint: "Enter Password",
                              obscureText:
                                  !loginController.passwordVisible.value,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Password is required';
                                if (value.length < 6)
                                  return 'Password must be at least 6 characters';
                                return null;
                              },
                              suffixIcon: GestureDetector(
                                onTap: loginController.togglePasswordVisibility,
                                child: Icon(
                                  loginController.passwordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 18,
                                  color: AppColors.lightDarkColor,
                                ),
                              ),
                            ),
                          ),
                          verticalSpace(Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Row(
                                  children: [
                                    Checkbox(
                                      value: loginController.checkBox.value,
                                      activeColor: AppColors.primaryColor,
                                      onChanged: (val) {
                                        loginController.checkBox.value =
                                            !loginController.checkBox.value;
                                      },
                                    ),
                                    const Text(
                                      "Remember me",
                                      style:
                                          TextStyle(fontFamily: 'PPTelegraf'),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(
                                    RoutesName.forgotPasswordScreen),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(Get.height * 0.02),
                          ContainerButtonModel(
                            borderRadius: BorderRadius.circular(8),
                            itext: 'Log In',
                            fontweight: FontWeight.w500,
                            textSize: 17,
                            containerHieght: 48,
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              // }
                              Get.to(BottomNavBarScreen());
                            },
                          ),
                          Spacer(),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Get.toNamed(RoutesName.checkRatesScreen);
                                  Get.to(CheckRatesScreen());
                                },
                                child: Text('Check Rates',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    )),
                              ),
                              verticalSpace(15),
                              Text(
                                'Create a free account',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PPTelegraf',
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              verticalSpace(30),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
