import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/main.dart';
import 'package:nano_doap_c4cem/models/login_response_model.dart';
import 'package:nano_doap_c4cem/services/remote_service.dart';
import 'package:nano_doap_c4cem/utils/shared_prefs_constants.dart';
import 'package:nano_doap_c4cem/views/home_screen.dart';

class LoginScreenController extends GetxController{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isBusy = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void loginBtnClicked() async{
    if(emailController.text.isEmpty || passwordController.text.isEmpty){
      Get.snackbar('Error', 'Please enter email and password');
      return;
    }
    isBusy.value = true;

    LoginResponseModel? loginData = await RemoteService.login(
        email: emailController.text.trim(),
        password: passwordController.text
    );

    if(loginData != null){
      if(loginData!.status == 'success'){
        sharedPrefs.setString(SharedPrefsConstants.ACCESS_TOKEN, loginData.token!);
        sharedPrefs.setString(SharedPrefsConstants.USER_ID, loginData.user!.id!);
        sharedPrefs.setString(SharedPrefsConstants.USER_NAME, loginData.user!.name!);
        sharedPrefs.setString(SharedPrefsConstants.USER_EMAIL, loginData.user!.email!);
        sharedPrefs.setString(SharedPrefsConstants.USER_PHONE, loginData.user!.phone!);
        sharedPrefs.setString(SharedPrefsConstants.USER_COUNTRY, loginData.user!.country!);

        Get.offAll(()=>HomeScreen());
      }else{
        Get.snackbar('Error', loginData!.message ?? 'Login Failed');
      }
    }
    isBusy.value = false;

  }

  void registerBtnClicked() {

  }
}