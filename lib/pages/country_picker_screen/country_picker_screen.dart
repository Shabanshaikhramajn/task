// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task/controller/country_picker_controller/country_picker_controller.dart';
// import 'package:task/utils/app_colors.dart';
// import 'package:task/utils/common_snackbar.dart';
// import 'package:task/utils/container_button_model.dart';
// import 'package:task/utils/widgets.dart';

// void showCountryPickerBottomSheet(BuildContext context) {
//   final countryPickerController = Get.put(CountryPickerController());

//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (_) {
//       return DraggableScrollableSheet(
//         initialChildSize: 0.8,
//         maxChildSize: 0.95,
//         minChildSize: 0.4,
//         expand: false,
//         builder: (_, scrollController) {
//           return Material(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(19),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   verticalSpace(Get.height * .015),
//                   Text(
//                     'Search Country',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.darkColor,
//                     ),
//                   ),
//                   const SizedBox(height: 12),

//                   /// Search Field
//                   TextField(
//                     cursorColor: AppColors.darkColor,
//                     controller: countryPickerController.searchController,
//                     onChanged: countryPickerController.filterCountries,
//                     decoration: InputDecoration(
//                       enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: AppColors.greyColor,
//                           width: 2,
//                         ),
//                       ),
//                       suffixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   const Padding(
//                     padding: EdgeInsets.only(left: 4),
//                     child: Text(
//                       "Popular Countries",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Obx(() => Column(
//                         children: countryPickerController.allCountries
//                             .where((country) => countryPickerController
//                                 .popularCountries
//                                 .contains(country["countryName"]))
//                             .map((country) => ListTile(
//                                   leading: CircleAvatar(
//                                     backgroundImage: NetworkImage(
//                                         country["countryFlag"] ?? ""),
//                                   ),
//                                   title: Text(country["countryName"] ?? ""),
//                                   trailing: Checkbox(
//                                     value: countryPickerController
//                                             .selectedCountry
//                                             .value?["countryCode"] ==
//                                         country["countryCode"],
//                                     onChanged: (_) => countryPickerController
//                                         .selectCountry(country),
//                                   ),
//                                 ))
//                             .toList(),
//                       )),

//                   verticalSpace(Get.height * .015),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 4),
//                     child: Text(
//                       "All Countries",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Expanded(
//                     child: Obx(() => ListView.builder(
//                           controller: scrollController,
//                           itemCount:
//                               countryPickerController.filteredCountries.length,
//                           itemBuilder: (_, index) {
//                             final country = countryPickerController
//                                 .filteredCountries[index];
//                             return Container(
//                               decoration: BoxDecoration(
//                                 color: index.isEven
//                                     ? AppColors.secondaryColor
//                                     : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: ListTile(
//                                 leading: CircleAvatar(
//                                   backgroundImage: NetworkImage(
//                                       country["countryFlag"] ?? ""),
//                                 ),
//                                 title: Text(country["countryName"] ?? ""),
//                                 trailing: Checkbox(
//                                   activeColor: AppColors.primaryColor,
//                                   value: countryPickerController.selectedCountry
//                                           .value?["countryCode"] ==
//                                       country["countryCode"],
//                                   onChanged: (_) {
//                                     countryPickerController
//                                         .selectedCountry.value = country;
//                                          countryPickerController.selectedCountry.refresh();
//                                   },
//                                 ),
//                               ),
//                             );
//                           },
//                         )),
//                   ),
//                   const SizedBox(height: 12),
//                   ContainerButtonModel(
//                     borderRadius: BorderRadius.circular(8),
//                     itext: 'Continue',
//                     fontweight: FontWeight.w500,
//                     textSize: 17,
//                     containerHieght: 48,
//                     onPressed: () {
//                       if (countryPickerController.selectedCountry.value ==
//                           null) {
//                         CommonSnackbar.showSnackbar(
//                             message:
//                                 "Please select a country before continuing.",
//                             backgroundColor: Colors.red);
//                       } else {
//                         Get.back();
//                       }
//                     },
//                   ),
//                   verticalSpace(Get.height * .01),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/country_picker_controller/country_picker_controller.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/common_snackbar.dart';
import 'package:task/utils/container_button_model.dart';
import 'package:task/utils/widgets.dart';

void showCountryPickerBottomSheet(BuildContext context) {
  final controller = Get.put(CountryPickerController());

  showModalBottomSheet(
    isDismissible: true,
    enableDrag: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        builder: (_, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                verticalSpace(Get.height * .015),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Search Country',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                /// Search Field
                TextField(
                  cursorColor: AppColors.darkColor,
                  controller: controller.searchController,
                  onChanged: controller.filterCountries,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.greyColor,
                        width: 2,
                      ),
                    ),
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Obx(() => ListView.builder(
                        controller: scrollController,
                        itemCount: controller.filteredCountries.length,
                        itemBuilder: (_, index) {
                          final country = controller.filteredCountries[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: index.isOdd
                                    ? AppColors.secondaryColor
                                    : AppColors.transparentColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(country["countryFlag"] ?? ""),
                              ),
                              title: Text(country["countryName"] ?? ""),
                              trailing: Obx(() => Checkbox(
                                    activeColor: AppColors.primaryColor,
                                    value:
                                        controller.selectedCountryIndex.value ==
                                            index,
                                    onChanged: (_) {
                                      controller.selectOnlyOne(index);
                                    },
                                  )),
                              onTap: () => controller.selectOnlyOne(index),
                            ),
                          );
                        },
                      )),
                ),
                ContainerButtonModel(
                  borderRadius: BorderRadius.circular(8),
                  itext: 'Continue',
                  fontweight: FontWeight.w500,
                  textSize: 17,
                  containerHieght: 48,
                  onPressed: () {
                    if (controller.selectedCountry.value == null) {
                      Get.snackbar(
                        'No Country Selected',
                        'Please select a country before continuing.',
                        backgroundColor: Colors.red.shade100,
                        colorText: Colors.red.shade900,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 2),
                      );
                      // CommonSnackbar.showSnackbar(
                      //     message: "Please select a country before continuing.",
                      //     backgroundColor: Colors.red);
                    } else {
                      Get.back();
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        },
      );
    },
  );
}
//
