import 'package:flutter/material.dart';
import 'package:nano_doap_c4cem/controllers/plastic_data_input_screen_controller.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/app_button.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';
import 'package:nano_doap_c4cem/views/components/image_capture_widget.dart';
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
              Obx(()=>ImageCaptureWidget(
                imagePath: controller.imagePath.value,
                onCameraButtonPressed: controller.cameraButtonPressed
              )),
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
