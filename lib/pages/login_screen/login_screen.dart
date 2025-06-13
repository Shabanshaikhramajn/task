import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/login_controller/login_controller.dart';
import 'package:task/res/routes/getx_route_names.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/app_strings.dart';
import 'package:task/utils/container_button_model.dart';
import 'package:task/utils/custom_text_form_field.dart';
import 'package:task/utils/text_style.dart';
import 'package:task/utils/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              verticalSpace(Get.height * 0.13),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppStrings.loginheading,
                      textAlign: TextAlign.left,
                      style: AppTextStyles.headline1),
                  Text(AppStrings.loginSubtitle,
                      textAlign: TextAlign.left,
                      style: AppTextStyles.headline2),
                ],
              ),
              verticalSpace(Get.height * 0.02),
              Divider(
                color: AppColors.textFieldIconColor,
              ),
              verticalSpace(Get.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: CustomTextFormField(
                  controller: loginController.emailController,
                  hint: "Enter Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              verticalSpace(Get.height * 0.010),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: CustomTextFormField(
                  controller: loginController.passwordController,
                  hint: "Enter Password",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  suffixIcon: GestureDetector(
                    child: SizedBox(
                      height: 8,
                      width: 8,
                      child: Icon(
                        loginController.passwordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.lightDarkColor,
                        size: 18,
                      ),
                    ),
                    onTap: () {
                      loginController
                          .togglePasswordVisibility(); // Toggle password visibility on click
                    },
                  ),
                ),
              ),
              verticalSpace(Get.height * 0.010),
              CheckboxTheme(
                data: CheckboxThemeData(
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (!states.contains(WidgetState.selected)) {
                      return Colors.transparent;
                    }
                    return null;
                  }),
                  side: const BorderSide(color: Colors.transparent, width: 2),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min
                        children: [
                          Checkbox(
                            fillColor: loginController.checkBox.value
                                ? WidgetStatePropertyAll(AppColors.primaryColor)
                                : WidgetStatePropertyAll(
                                    AppColors.secondaryColor),
                            value: loginController.checkBox.value,
                            onChanged: (value) async {
                              loginController.checkBox.value = value!;
                            },
                          ),
                          Text("Remember me", style: AppTextStyles.headline2),
                        ],
                      ),
                    ),
                    Text("Remember me", style: TextStyle()),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesName.forgotPasswordScreen);
                        },
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 18))),
                  ],
                ),
              ),
              verticalSpace(Get.height * 0.010),
              ContainerButtonModel(
                  itext: 'Login',
                  containerHieght: 50,
                  onPressed: () {
                    Get.toNamed(RoutesName.bottomNavBarScreen);
                  }),
              verticalSpace(Get.height * 0.010),

              Text('Check Rates'),
              verticalSpace(Get.height * 0.010),
              Text('Create a free account'),


            ],
          )),
        ),
      ),
    );
  }
}
