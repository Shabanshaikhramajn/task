import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/country_picker_controller/country_picker_controller.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/container_button_model.dart';
import 'package:task/utils/widgets.dart';

void showCountryPickerBottomSheet(BuildContext context) {
  final controller = Get.put(CountryPickerController());

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.95,
        minChildSize: 0.4,
        expand: false,
        builder: (_, scrollController) {
          return Material(
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(Get.height * .015),

                  /// Title
                  Text(
                    'Search Country',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkColor,
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// Search Field
                  TextField(
                    cursorColor: AppColors.darkColor,
                    controller: controller.searchController,
                    onChanged: controller.filterCountries,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyColor,
                          width: 2,
                        ),
                      ),
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Popular Countries
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      "Popular Countries",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(() => Column(
                        children: controller.popularCountries
                            .map((country) => ListTile(
                                  leading: CircleAvatar(
                                    child: Text(country[0] ?? ""),
                                  ),
                                  title: Text("$country"),
                                  trailing: Checkbox(
                                    value: controller.selectedCountry.value == country,
                                    onChanged: (_) => controller.selectCountry(country),
                                  ),
                                ))
                            .toList(),
                      )),
                  verticalSpace(Get.height * .015),

                  /// All Countries Title
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      "All Countries",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// Scrollable List of All Countries
                  Expanded(
                    child: Obx(() => ListView.builder(
                          controller: scrollController,
                          itemCount: controller.filteredCountries.length,
                          itemBuilder: (_, index) {
                            final country = controller.filteredCountries[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: index.isEven
                                    ? AppColors.secondaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text(country[0]),
                                ),
                                title: Text(country),
                                trailing: Checkbox(
                                  value: controller.selectedCountry.value == country,
                                  onChanged: (_) => controller.selectCountry(country),
                                ),
                              ),
                            );
                          },
                        )),
                  ),

                  const SizedBox(height: 12),

                  /// Continue Button
                  ContainerButtonModel(
                    borderRadius: BorderRadius.circular(8),
                    itext: 'Continue to Login',
                    fontweight: FontWeight.w500,
                    textSize: 17,
                    containerHieght: 48,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  verticalSpace(Get.height * .01),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
