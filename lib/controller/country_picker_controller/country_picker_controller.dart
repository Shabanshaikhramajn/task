import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/check_rates_controller/check_rates_controller.dart';

class CountryPickerController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final checkRatesController = Get.find<CheckRatesController>();

  var popularCountries = ["India", "Nigeria"].obs;

  final List<Map<String, String>> allCountries = [
    {
      "countryName": "Somalia",
      "countryCode": "SO",
      "countryFlag": "https://flagcdn.com/w40/so.png",
    },
    {
      "countryName": "Afghanistan",
      "countryCode": "AF",
      "countryFlag": "https://flagcdn.com/w40/af.png",
    },
    {
      "countryName": "Albania",
      "countryCode": "AL",
      "countryFlag": "https://flagcdn.com/w40/al.png",
    },
    {
      "countryName": "Australia",
      "countryCode": "AU",
      "countryFlag": "https://flagcdn.com/w40/au.png",
    },
    {
      "countryName": "Bangladesh",
      "countryCode": "BD",
      "countryFlag": "https://flagcdn.com/w40/bd.png",
    },
    {
      "countryName": "Brazil",
      "countryCode": "BR",
      "countryFlag": "https://flagcdn.com/w40/br.png",
    },
    {
      "countryName": "France",
      "countryCode": "FR",
      "countryFlag": "https://flagcdn.com/w40/fr.png",
    },
    {
      "countryName": "Japan",
      "countryCode": "JP",
      "countryFlag": "https://flagcdn.com/w40/jp.png",
    },
    {
      "countryName": "China",
      "countryCode": "CN",
      "countryFlag": "https://flagcdn.com/w40/cn.png",
    },
    {
      "countryName": "Russia",
      "countryCode": "RU",
      "countryFlag": "https://flagcdn.com/w40/ru.png",
    },
  ];

  // Reactive filtered list
  var filteredCountries = <Map<String, String>>[].obs;

  // Selected country object (Map)
  var selectedCountry = Rxn<Map<String, String>>();

  @override
  void onInit() {
    super.onInit();
    filteredCountries.assignAll(allCountries);
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries.assignAll(allCountries);
    } else {
      filteredCountries.assignAll(
        allCountries.where((country) {
          return country["countryName"]!
              .toLowerCase()
              .contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  void selectCountry(Map<String, String> country) {
    selectedCountry.value = country;
  }

  void selectCountryToShowRates(country) async{
    checkRatesController.selectedCountryCode.value = country['countryCode'];
    checkRatesController.selectedCountryFlagUrl.value = country['countryFlag'];
    checkRatesController.selectedCountryName.value = country['countryName'];
   await checkRatesController.getCurrencyRates();
   Get.back();

  }
}
