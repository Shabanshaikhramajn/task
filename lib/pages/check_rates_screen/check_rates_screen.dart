import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/check_rates_controller/check_rates_controller.dart';
import 'package:task/pages/country_picker_screen/country_picker_screen.dart';
import 'package:task/pages/login_screen/login_screen.dart';
import 'package:task/res/routes/getx_route_names.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/container_button_model.dart';
import 'package:task/utils/text_style.dart';
import 'package:task/utils/widgets.dart';
import 'package:flutter/cupertino.dart';

class CheckRatesScreen extends StatefulWidget {
  CheckRatesScreen({super.key});

  @override
  State<CheckRatesScreen> createState() => _CheckRatesScreenState();
}

class _CheckRatesScreenState extends State<CheckRatesScreen> {
  CheckRatesController checkRatesController = Get.put(CheckRatesController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkRatesController.getCurrencyRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // verticalSpace(Get.statusBarHeight),
                  verticalSpace(Get.height * .01),
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
                            style: AppTextStyles.headline1),
                      ),
                    ],
                  ),
                  verticalSpace(Get.height * .04),
                  Divider(
                    color: AppColors.textFieldIconColor,
                    height: 2,
                  ),
                  verticalSpace(Get.height * .04),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Sending To',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ),
                  verticalSpace(Get.height * .012),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // Image.asset("assets/flags/nigeria.png",  height: 24),
                        SizedBox(width: 10),
                        const Expanded(
                            child: Text(
                          "Nigeria",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        )),
                        InkWell(
                            onTap: () {
                              //  Get.to(()=> CountryPickerBottomSheet());
                              showCountryPickerBottomSheet(context);
                            },
                            child: Icon(Icons.search)),
                      ],
                    ),
                  ),
                  verticalSpace(Get.height * .02),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'You send',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ),
                  verticalSpace(Get.height * .012),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Text("1.0",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Text("GBP",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8),
                        // Image.asset("assets/flags/uk.png", height: 24)
                      ],
                    ),
                  ),
                  verticalSpace(Get.height * .02),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Recipient Gets',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ),
                  verticalSpace(Get.height * .012),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Text("1.0",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Text("GBP",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8),
                        // Image.asset("assets/flags/uk.png", height: 24)
                      ],
                    ),
                  ),
                  verticalSpace(Get.height * .03),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // height: 300,

                    child: Column(
                      children: [
                        infoRow("Transfer Fees", "2.00 GBP"),
                        infoRow("Exchange Rate", "2138.12 NGN"),
                        verticalSpace(Get.height * .008),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          padding: EdgeInsets.symmetric(
                              horizontal: 17, vertical: 16),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Total Amount To Pay",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)),
                              Text("3.00 GBP",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 35.0),
        child: ContainerButtonModel(
          borderRadius: BorderRadius.circular(8),
          itext: 'Continue to Login',
          fontweight: FontWeight.w500,
          textSize: 17,
          containerHieght: 48,
          onPressed: () {
            // Get.toNamed(RoutesName.loginScreen);
             Get.to(()=>LoginScreen());
          },
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
