import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/bottom_nav_bar_controller/bottom_nav_bar_controller.dart';
import 'package:task/pages/dashboard_screen/dashboard_screen.dart';
import 'package:task/pages/history_screen/history_screen.dart';
import 'package:task/pages/profile_screen/profile_screen.dart';
import 'package:task/pages/recipient_screen/recipient_screen.dart';
import 'package:task/res/routes/getx_route_names.dart';
import 'package:task/utils/App_assets.dart';
import 'package:task/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});
  BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());

  Widget screenWidget() {
    switch (bottomNavBarController.selectedPage.value) {
      case 0:
        return DashboardScreen();

      case 1:
        return RecipientScreen();
      case 2:
        return SizedBox();
      case 3:
        return HistoryScreen();
      case 4:
        return ProfileScreen();

      default:
        return Center(
          child: Text(""),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 73,
          width: 73,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primaryColor),
          child: FloatingActionButton.large(
            child: Image(
              image: AssetImage(AppAssets.sendMoneyIcon),
              height: 32,
              width: 32,
            ),
            backgroundColor: AppColors.primaryColor,
            shape: CircleBorder(),
            
            onPressed: () {
              Get.toNamed(RoutesName.sendMoneyScreen);
            },
          ),
        ),
        body: Obx(() => screenWidget()),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.greyColor,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            currentIndex: bottomNavBarController.selectedPage.value,
            unselectedFontSize: 10,
            selectedFontSize: 12,

            selectedLabelStyle: TextStyle(fontSize: 14, color: AppColors.primaryColor),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            items: [
               BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6.0,),
                    child: SvgPicture.asset(AppAssets.dashboardIcon, height: 25, width: 25, semanticsLabel: 'Acme Logo', ),
                  ),
                  label: "Dashboard"),
                  BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6.0,),
                    child: SvgPicture.asset(AppAssets.profileIcon, height: 25, width: 25, semanticsLabel: 'Acme Logo', ),
                  ),
                  label: "Recepient"),
                  BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6.0,),
                    child: SvgPicture.asset(  AppAssets.sendMoneyIcon    , height: 25, width: 25, semanticsLabel: 'Acme Logo', ),
                  ),
                  label: "Send Money"),
                  BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6.0,),
                    child: SvgPicture.asset(AppAssets.historyIcon, height: 25, width: 25, semanticsLabel: 'Acme Logo', ),
                  ),
                  label: "History"),
                  BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6.0,),
                    child: SvgPicture.asset(AppAssets.profileIcon2 , height: 25, width: 25, semanticsLabel: 'Acme Logo', ),
                  ),
                  label: "Profile"),
             
            ],
            onTap: (index){
              bottomNavBarController.selectedPage.value = index;

            },
          ),
        )); 
  }
}
