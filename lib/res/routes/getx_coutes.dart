import 'package:get/get.dart';
import 'package:task/pages/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:task/pages/country_picker_screen/country_picker_screen.dart';
import 'package:task/pages/forgot_password_screen/forgot_password.dart';
import 'package:task/pages/login_screen/login_screen.dart';
import 'package:task/pages/check_rates_screen/check_rates_screen.dart';
import 'package:task/res/routes/getx_route_names.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: RoutesName.loginScreen,
        page: () => LoginScreen(),
      ),
      GetPage(
        name: RoutesName.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
      ),
      GetPage(
        name: RoutesName.bottomNavBarScreen,
        page: () => BottomNavBarScreen(),
      ),
      GetPage(
        name: RoutesName.sendMoneyScreen,
        page: () => BottomNavBarScreen(), // Change to actual SendMoneyScreen if needed
      ),
      GetPage(
        name: RoutesName.checkRatesScreen,
        page: () => CheckRatesScreen(),
      ),
      //  GetPage(
      //   name: RoutesName.countryPickerScreen,
      //   page: () => CountryPickerBottomSheet(),
      // ),
    ];
  }
}
