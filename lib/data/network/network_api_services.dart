import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task/utils/common_snackbar.dart';


class NetworkApiService {
  // GET API
  Future<http.Response> getApi(accessToken, String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 15));

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST API
  Future<http.Response> postApi(data, String url, String token) async {
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 15));
   print("res is ${response.body}");
   print("url is  ${response.body}");
      return response;
    } on TimeoutException catch (e) { 
       CommonSnackbar.showSnackbar(
  message:  "Request timed out"
       );
     
      return http.Response('Request Timout', 403);
    } catch (e) {
      rethrow;
    }
  }

// Put Api
  Future<http.Response> putApi(String token, String url, data) async {
    try {
      final response = await http
          .put(
            Uri.parse(url),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 15));

      return response;
    } on TimeoutException catch (e) {
      CommonSnackbar.showSnackbar(
  message:  "Request timed out"
       );
     
      return http.Response('Request Timout', 403);
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> deleteApi(String token, String url) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 15));

      return response;
    } on TimeoutException catch (e) {
      CommonSnackbar.showSnackbar(
  message:  "Request timed out"
       );
     
      return http.Response('Request Timout', 403);
    } catch (e) {
      rethrow;
    }
  }
}
