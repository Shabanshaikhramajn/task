import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task/models/country_data_model.dart';
import 'package:task/res/routes/repository/currency_data_repo/currency_data_repo.dart';
import 'package:task/utils/circular_loader.dart';
import 'package:task/utils/common_snackbar.dart';
import 'package:task/utils/connection_check.dart';

class CheckRatesController extends GetxController
    with StateMixin<List<CountryDataModel>> {
  final _apiServices = CurrencyDataRepo();

  var currencyRates = <CountryDataModel>[].obs;
  RxString selectedCountryCode = "NGN".obs;
  RxString selectedCountryFlagUrl = "https://flagcdn.com/w40/ng.png".obs;
  final TextEditingController gbpController = TextEditingController(text: "1.0"); 
  RxString selectedCountryName  = "Nigeria".obs;
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
      "currencyCode":  selectedCountryCode.value,
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
