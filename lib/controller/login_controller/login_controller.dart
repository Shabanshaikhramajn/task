import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 var checkBox = false.obs;
  var passwordVisible = false.obs;
  void togglePasswordVisibility() {
    passwordVisible.value =
        !passwordVisible.value; 
  }

  
}
