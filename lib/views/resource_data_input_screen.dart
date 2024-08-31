import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nano_doap_c4cem/controllers/resource_data_input_screen_controller.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/app_button.dart';
import 'package:nano_doap_c4cem/views/components/app_text_field.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';
import 'package:nano_doap_c4cem/views/components/image_capture_widget.dart';
import 'package:nano_doap_c4cem/views/stylesheets/padding_stylesheet.dart';
import 'package:nano_doap_c4cem/views/stylesheets/spacing_style.dart';

class ResourceDataInputScreen extends StatelessWidget {
  final ResourceDataInputScreenController controller = Get.put(ResourceDataInputScreenController());
  ResourceDataInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Information related to resources"),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: PaddingStyle.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(()=>ImageCaptureWidget(
                imagePath: controller.imagePath.value,
                onCameraButtonPressed: controller.cameraButtonPressed
              )),
              Spacing.height16,
              AppTextField(
                leadingIcon: "assets/icons/ic_resource.png",
                labelText: "Resource type",
                controller: controller.resourceTypeController,
              ),
              Spacing.height16,
              Obx(()=>AppButton(
                title: "Submit",
                onPressed: controller.imagePath.isNotEmpty ? controller.submitBtnPressed : null,
              ))
            ],
          ),
        ),
      )
    );
  }
}
