import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/check_rates_controller/check_rates_controller.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/text_style.dart';
import 'package:task/utils/widgets.dart';
import 'package:flutter/cupertino.dart';

class CheckRatesScreen extends StatelessWidget {
  CheckRatesScreen({super.key});
  CheckRatesController checkRatesController = Get.put(CheckRatesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldIconColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                verticalSpace(Get.statusBarHeight),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(
                          CupertinoIcons.arrow_left_circle,
                          size: 35,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text("Check Rates",
                          textAlign: TextAlign.left,
                          style: AppTextStyles.headline2),
                    ),
                  ],
                ),
                verticalSpace(Get.height * .012),
                 Expanded(child: Column(
                  children: [
                    verticalSpace(Get.height * .012),
                    Padding(padding: EdgeInsets.only(left: 30),
                     child: Text('Sending To'),
                    ),
                verticalSpace(Get.height * .012),
                         

                  ],
                 ))


              ],
            ),
          ),
        ),
      ),
    );
  }
}
