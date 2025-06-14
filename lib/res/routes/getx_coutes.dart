import 'package:get/get.dart';
import 'package:task/pages/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:task/pages/forgot_password_screen/forgot_password.dart';
import 'package:task/pages/login_screen/login_screen.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: 'login',
        page: () => LoginScreen(),
      ),
       GetPage(
        name: 'forgot_password',
        page: () => ForgotPasswordScreen(),
      ),
       GetPage(
        name: 'bottom_nav_bar',
        page: () => BottomNavBarScreen(),
      ),
       GetPage(
        name: 'send_money_screen',
        page: () => BottomNavBarScreen(),
      ),
    ];
  }
}
