import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task/res/routes/repository/currency_data_repo/currency_data_repo.dart';
import 'package:task/utils/circular_loader.dart';
import 'package:task/utils/common_snackbar.dart';
import 'package:task/utils/connection_check.dart';

class CheckRatesController extends GetxController {
  final _apiServices = CurrencyDataRepo();

  void getCurrencyRates() async {
    // bool internetCheck = await ConnectionService.getConnectionStatus();

    // if (internetCheck) {
    //   CommonSnackbar.showSnackbar(message: "No internet connection");
    //   return;
    // }
    print("ptirnt");
    // CircularLoader.show();

    

//   Map data =  {
//  "userName" : "parth.calyx@gmail.com",
//  "password" : "Calyx@1236",
//  "credentialFlag": "",
//  "clientID" : "1",
//  "branchID" : "2",
//  "otp":"",
//  "resendotp":"", 
//  "captcha":"", 
//  "latitude": "19.995233321819526",
//  "longitude": "73.74394510479006", 
//  "deviceId": "73C03944-F185-4F31-80BE-61D2FB8BD362", 
//  "ipAddress": "192.168.1.55",
//  "flutterval" : "",
//  "registrationval": ""
// } ;

    final data = {
      "clientID": "1",
      "countryID": "6",
      "paymentTypeID": "1",
      "paymentDepositTypeID": "1",
      "deliveryTypeID": "1",
      "transferAmount": "10",
      "currencyCode": "NGN",
      "branchID": "2",
      "BaseCurrencyID": ""
    };

    _apiServices.getCurrencyDataRepo(data).then((http.Response value) async {
      if (value.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(value.body);

        if (true) {
        // CircularLoader.hide();

          // authenticationModel = AuthenticationModel.fromJson(responseBody);
          // getApiController.saveAccessToken(authenticationModel);
        }
      } else {
        // CircularLoader.hide();
        CommonSnackbar.showSnackbar(message: "Something went wrong");
      }
    }).catchError((error, stackTrace) {
      CommonSnackbar.showSnackbar(message: "Something went wrong");
          print('error is $error');
          print('stack is $stackTrace');
      // CircularLoader.hide();
    });
  }
}
