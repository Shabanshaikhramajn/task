import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/controller/check_rates_controller/check_rates_controller.dart';
import 'package:task/pages/country_picker_screen/country_picker_screen.dart';
import 'package:task/pages/login_screen/login_screen.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/container_button_model.dart';
import 'package:task/utils/custom_text_form_field.dart';
import 'package:task/utils/text_style.dart';
import 'package:task/utils/widgets.dart';

class CheckRatesScreen extends StatefulWidget {
  const CheckRatesScreen({super.key});

  @override
  State<CheckRatesScreen> createState() => _CheckRatesScreenState();
}

class _CheckRatesScreenState extends State<CheckRatesScreen> {
  final CheckRatesController checkRatesController =
      Get.put(CheckRatesController());

  @override
  void initState() {
    super.initState();
    checkRatesController.getCurrencyRates();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    checkRatesController.disposeValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: checkRatesController.obx(
        (currencyRates) {
          if (currencyRates == null || currencyRates.isEmpty) {
            return Center(child: Text("No currency data found"));
          }
          final data = currencyRates[0];
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      verticalSpace(Get.height * .02),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 12.0),
                              child: Icon(CupertinoIcons.arrow_left_circle,
                                  size: 35, color: AppColors.primaryColor),
                            ),
                          ),
                          Expanded(
                            child: Text("Check Rates",
                                textAlign: TextAlign.left,
                                style: AppTextStyles.headline1),
                          ),
                        ],
                      ),
                      verticalSpace(Get.height * .032),
                      Divider(color: AppColors.textFieldIconColor, height: 2),
                      verticalSpace(Get.height * .04),
                      _sectionTitle("Sending To"),
                      sendingToRow(
                        flagUrl: 'https://flagcdn.com/w40/ng.png',
                        title: 'Nigeria',
                        trailing: IconButton(
                          icon: Icon(Icons.search, size: 30),
                          onPressed: () =>
                              showCountryPickerBottomSheet(context),
                        ),
                      ),
                      verticalSpace(Get.height * .02),
                      _sectionTitle("You send"),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                  fontWeight: FontWeight.bold,
                                  controller:
                                      checkRatesController.gbpController.value,
                                  colors: AppColors.transparentColor,
                                  borderColor: AppColors.transparentColor,
                                  onChanged: (value) {
                                    checkRatesController
                                        .updateConvertedAmount();
                                  },
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  filteringTextInputFormatter:
                                      FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d*\.?\d{0,3}$'),
                                  ),
                                  hint: ""),
                            ),
                            Spacer(),
                            Text("GBP",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(width: 15),
                            ClipOval(
                              child: Image.network(
                                "https://flagcdn.com/w40/gb.png",
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.flag),
                              ),
                            ),
                            const SizedBox(width: 5),
                            // if (trailing != null) trailing,
                          ],
                        ),
                      ),
                      verticalSpace(Get.height * .02),
                      _sectionTitle("Recipient Gets"),
                      // secondRowContainer(
                      //     flagUrl: 'https://flagcdn.com/w40/ng.png',
                      //     title:
                      //         "${data.rate ?? 0 * double.parse(checkRatesController.gbpController.value.text)}",
                      //     currencyType: "${data.currencyCode}"),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Obx(
                              () => Text(
                                "${checkRatesController.recepientGetsRate.value}",
                                style: GoogleFonts.inter(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Spacer(),
                            Text(
                                "${checkRatesController.selectedCountryName.value}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(width: 15),
                            ClipOval(
                              child: Image.network(
                                "https://flagcdn.com/w40/ng.png",
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.flag),
                              ),
                            ),
                            const SizedBox(width: 5),
                            // if (trailing != null) trailing,
                          ],
                        ),
                      ),
                      verticalSpace(Get.height * .03),
                      Container(
                        padding: const EdgeInsets.only(top: 16, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            infoRow("Transfer Fees",
                                "${checkRatesController.transferFees.value} GBP"),
                            infoRow("Exchange Rate", "${data.rate} "),
                            verticalSpace(Get.height * .008),
                            Container(
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 16),
                              decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Amount To Pay",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                  Obx(
                                    () => Text(
                                        "${checkRatesController.totalAmountToPay.value} GBP",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15)),
                                  )
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
          );
        },
        onLoading: const Center(
            child: CircularProgressIndicator(
          strokeWidth: 5,
          color: AppColors.primaryColor,
        )),
        onError: (error) =>
            Center(child: Text(error ?? "Something went wrong")),
        onEmpty: const Center(child: Text("No data available")),
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
              Get.back();
            }),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      ),
    );
  }

  Widget secondRowContainer(
      {required String flagUrl,
      required String title,
      required String currencyType,
      Widget? trailing}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
              child: Obx(
            () => Text(
              "${checkRatesController.recepientGetsRate.value}",
              style:
                  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )),
          Spacer(),
          Text("", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(width: 15),
          ClipOval(
            child: Image.network(
              flagUrl,
              width: 40,
              height: 40,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.flag),
            ),
          ),
          const SizedBox(width: 5),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget firsstRowContainer(
      {required String flagUrl,
      required String title,
      required String currencyType,
      Widget? trailing}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style:
                  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Text("", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(width: 15),
          ClipOval(
            child: Image.network(
              flagUrl,
              width: 40,
              height: 40,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.flag),
            ),
          ),
          const SizedBox(width: 5),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget sendingToRow(
      {required String flagUrl, required String title, Widget? trailing}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              flagUrl,
              width: 40,
              height: 40,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.flag),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Text(
              title,
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          // SizedBox(width: 15),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
