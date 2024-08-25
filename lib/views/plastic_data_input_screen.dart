import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nano_doap_c4cem/controllers/plastic_data_input_screen_controller.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/app_button.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';
import 'package:nano_doap_c4cem/views/stylesheets/padding_stylesheet.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/views/stylesheets/spacing_style.dart';

class PlasticDataInputScreen extends StatelessWidget {
  final PlasticDataInputScreenController controller = PlasticDataInputScreenController();
  PlasticDataInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Information related to Plastic"),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: PaddingStyle.all16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(()=> Visibility(
                  visible: controller.imagePath.isNotEmpty,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(controller.imagePath.value),
                      height: Get.height * 0.35,
                    ),
                  )
              )),
              Spacing.height16,
              InkWell(
                onTap: controller.cameraButtonPressed,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBrightColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Obx(()=>Padding(
                    padding: controller.imagePath.isNotEmpty ? PaddingStyle.all8 : PaddingStyle.all16,
                    child: Image.asset(
                      'assets/icons/ic_camera.png',
                      width: controller.imagePath.isNotEmpty ?  50:100,
                      height: controller.imagePath.isNotEmpty ? 55:110,
                    ),
                  )),
                ),
              ),
              Spacing.height16,
              Container(
                width: double.infinity,
              ),
              Obx(()=>AppButton(
                title: "Submit",
                onPressed: controller.imagePath.isNotEmpty ? controller.submitButtonPressed : null,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
