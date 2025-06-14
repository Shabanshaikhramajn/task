import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/pages/login_screen/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'PPTelegraf',
        useMaterial3: true,
      ),
      home: LoginScreen(),
      // initialRoute: RoutesName.loginScreen,
      // getPages: AppRoutes.appRoutes(),
    );
  }
}



// https://currencyexchangesoftware.eu/pilot/api/checkrateslistcountry/checkrateslistcountry

// {
//     "clientID":"1",
//     "countryID":"6",
//     "paymentTypeID":"1",
//     "paymentDepositTypeID":"1",
//     "deliveryTypeID":"1",
//     "transferAmount":"10",
//     "currencyCode":"NGN",
//     "branchID":"2",
//     "BaseCurrencyID":""
// }


// https://currencyexchangesoftware.eu/pilot/userlogin/checklogin
// {
//     "userName" : "parth.calyx@gmail.com",
//     "password" : "Calyx@1236",
//     "credentialFlag": "",
//     "clientID" : "1",
//     "branchID" : "2",
//     "otp":"",
//     "resendotp":"",
//     "captcha":"", 
//     "latitude": "19.995233321819526",
//     "longitude": "73.74394510479006", 
//     "deviceId": "73C03944-F185-4F31-80BE-61D2FB8BD362", 
//     "ipAddress": "192.168.1.55",
//     "flutterval" : "",
//     "registrationval": ""
// } 