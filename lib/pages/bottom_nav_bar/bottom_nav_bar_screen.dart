import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/bottom_nav_bar_controller/bottom_nav_bar_controller.dart';
import 'package:task/pages/dashboard_screen/dashboard_screen.dart';
import 'package:task/pages/history_screen/history_screen.dart';
import 'package:task/pages/profile_screen/profile_screen.dart';
import 'package:task/pages/recipient_screen/recipient_screen.dart';
import 'package:task/res/routes/getx_route_names.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/circular_loader.dart';

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
            image: AssetImage('assets/icons/send_money'),
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
          selectedItemColor: AppColors.lightDarkColor ,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: AppColors.greyColor,
          currentIndex: bottomNavBarController.selectedPage.value,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          selectedLabelStyle: TextStyle(fontSize: 12), 
          unselectedLabelStyle: TextStyle(fontSize: 12), 
          items: [
            if (bottomNavBarController.selectedPage.value == 0)
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6.0,),
                    child: Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),
                    
              
                  ),
                  label: "Dashboard")
            else
              BottomNavigationBarItem(
                  icon: Padding(padding: const EdgeInsets.only(bottom: 6.0),
                   child: Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),
                 
                   ),
                  label: "Dashboard"),
            if (bottomNavBarController.selectedPage.value == 1)
              BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child:Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),),
                  label: "Recipient")
            else
              BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),),
                  label: "Recipient"),
         
            BottomNavigationBarItem(
              
                icon: Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),
                label: "Send Money"),
            if (bottomNavBarController.selectedPage.value == 3)
              BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0), 
                      child:Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),),
                  label: "History")
            else
              BottomNavigationBarItem(
                  icon: Padding(padding: const EdgeInsets.only(bottom: 6.0),
                   child: Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),),
                  label: "History"),
           
            if (bottomNavBarController.selectedPage.value == 4)
              BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                       child: Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),),
                  label: "Profile")
            else
              BottomNavigationBarItem(
                  icon:
                  Padding(padding: const EdgeInsets.only(bottom: 6.0), 
                  child:Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),),
                  label: "Profile"),

          ],
          // onTap: (onTap) {
          //   if (onTap != 2) {
          //     bottomNavBarController.selectedPage.value = onTap;
          //   } else if (onTap == 1) {
          //     CircularLoader.show();
          //   } else if (onTap == 3) {
          //   }
          // },
        ),

      )  );
  }
}
