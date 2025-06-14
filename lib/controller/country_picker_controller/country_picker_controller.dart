import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryPickerController extends GetxController {
  TextEditingController searchController = TextEditingController();

  var popularCountries = [
    "India",
    "United States"
  ].obs;

  var allCountries = [
    "India",
    "United States",
    "United Kingdom",
    "Canada",
    "Australia",
    "Germany",
    "France",
    "Japan",
    "China",
    "Brazil",
  ];

  var filteredCountries = <String>[].obs;

  var selectedCountry = "".obs;

  @override
  void onInit() {
    super.onInit();
    filteredCountries.value = allCountries;
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries.value = allCountries;
    } else {
      filteredCountries.value = allCountries
          .where((country) =>
              country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void selectCountry(String country) {
    selectedCountry.value = country;
  }
}
