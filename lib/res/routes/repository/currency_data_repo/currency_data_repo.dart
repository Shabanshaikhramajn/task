import 'package:http/http.dart' as http;
import 'package:task/data/network/network_api_services.dart';
import 'package:task/utils/App_url.dart';

class CurrencyDataRepo {
  final _apiService = NetworkApiService();

  //advance payment api hits form here
  Future<http.Response> getCurrencyDataRepo(data) async {
    http.Response response =
        await _apiService.postApi(data, AppUrl.countrylistRates, "");

    return response;
  }
  // Future<http.Response> getApiPaymentRequests(accessToken) async {
  //   http.Response response =
  //       await _apiService.getApi(accessToken, AppUrl., );

  //   return response;
  // }
}
