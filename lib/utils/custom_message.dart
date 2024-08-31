import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';

class CustomMessage{
  static void showErrorMessage({required String title, required String message}){
    Get.snackbar(
        title,
        message,
        backgroundColor: AppColors.warningColor,
        colorText: Colors.white
    );
  }
  static void showSuccessMessage({required String title, required String message}){
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.successColor,
      colorText: AppColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM
    );
  }
}