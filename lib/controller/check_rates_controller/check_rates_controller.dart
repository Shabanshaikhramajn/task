import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task/models/country_data_model.dart';
import 'package:task/res/routes/repository/currency_data_repo/currency_data_repo.dart';
import 'package:task/utils/common_snackbar.dart';
import 'package:task/utils/connection_check.dart';

class CheckRatesController extends GetxController
    with StateMixin<List<CountryDataModel>> {
  final _apiServices = CurrencyDataRepo();

  var currencyRates = <CountryDataModel>[].obs;
  RxString selectedCountryCode = "NGN".obs;
  RxString selectedCountryFlagUrl = "https://flagcdn.com/w40/ng.png".obs;
  final gbpController = TextEditingController(text: "1.0").obs;
  RxString selectedCountryName = "Nigeria".obs;
  RxString recepientGetsRate = "".obs;
  RxString totalAmountToPay = "1.00".obs;
  RxInt transferFees = 0.obs;

  void updateConvertedAmount() {
    final text = gbpController.value.text;
    final rate = currencyRates.isNotEmpty ? currencyRates[0].rate ?? 0 : 0;
    transferFees.value = currencyRates[0].transferFeesGBP!;

    if (text.isEmpty) {
      recepientGetsRate.value = "0.00";
      totalAmountToPay.value = "0.00";
      transferFees.value = 0;
      return;
    }

    final value = double.tryParse(text);
    if (value == null) {
      recepientGetsRate.value = "0.00";
      totalAmountToPay.value = "0.00";
      return;
    }

    recepientGetsRate.value = (value * rate).toStringAsFixed(2);
    totalAmountToPay.value = (value + transferFees.value).toStringAsFixed(2);
  }

  void disposeValues() {
    gbpController.value.text = "1.0";
    recepientGetsRate.value = "";
    transferFees.value = 0;
    totalAmountToPay.value = "";
    selectedCountryName.value = "Nigeria";
  }

  Future<void> getCurrencyRates() async {
    bool internetCheck = await ConnectionService.getConnectionStatus();

    if (internetCheck) {
      CommonSnackbar.showSnackbar(message: "No internet connection");
      change(null, status: RxStatus.error("No internet connection"));
      return;
    }

    change(null, status: RxStatus.loading());
    // CircularLoader.show();

    final data = {
      "clientID": "1",
      "countryID": "6",
      "paymentTypeID": "1",
      "paymentDepositTypeID": "1",
      "deliveryTypeID": "1",
      "transferAmount": "10",
      "currencyCode": selectedCountryCode.value,
      "branchID": "2",
      "BaseCurrencyID": "22"
    };
    try {
      final response = await _apiServices.getCurrencyDataRepo(data);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['response'] == true && json['responseCode'] == "00") {
          List<dynamic> dataList = json['data'];
          List<CountryDataModel> rates =
              dataList.map((item) => CountryDataModel.fromJson(item)).toList();

          currencyRates.value =
              dataList.map((item) => CountryDataModel.fromJson(item)).toList();
          if (currencyRates.isNotEmpty) {
            recepientGetsRate.value = currencyRates[0].rate!.toStringAsFixed(2);
            transferFees.value = currencyRates[0].transferFeesGBP!;
            final text = gbpController.value.text;
            final value = double.tryParse(text);
            if (value == null) {
              totalAmountToPay.value = "0.00";
            } else {
              totalAmountToPay.value = (transferFees.value + value).toString();
            }
          }
          change(rates, status: RxStatus.success());
        } else {
          CommonSnackbar.showSnackbar(
              message: "API Error: ${json['responseCode']}");
          change(null,
              status: RxStatus.error("API Error: ${json['responseCode']}"));
        }
      } else {
        CommonSnackbar.showSnackbar(
            message: "HTTP Error: ${response.statusCode}");
        change(null,
            status: RxStatus.error("HTTP Error: ${response.statusCode}"));
      }
    } catch (e) {
      CommonSnackbar.showSnackbar(message: "Something went wrong");
      change(null, status: RxStatus.error("Something went wrong"));
      print('error is $e');
    } finally {
      // CircularLoader.hide();
    }
  }
}
