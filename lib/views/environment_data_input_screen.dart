import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/controllers/environment_data_input_screen_controller.dart';
import 'package:nano_doap_c4cem/views/components/app_button.dart';
import 'package:nano_doap_c4cem/views/stylesheets/spacing_style.dart';
import '../utils/app_colors.dart';
import 'components/app_text_field.dart';
import 'components/custom_appbar.dart';

class EnvironmentDataInputScreen extends StatelessWidget {
  final EnvironmentDataInputScreenController controller = Get.put(EnvironmentDataInputScreenController());
  EnvironmentDataInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Environment Data Input'
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              AppTextField(
                leadingIcon: 'assets/icons/ic_temperature.png',
                labelText: 'Temperature (°C )',
                hintText: 'Enter temperature in degree celsius',
                keyboardType: TextInputType.number,
                controller: controller.temperatureController,
              ),
              Spacing.height16,
              AppTextField(
                leadingIcon: 'assets/icons/ic_drop.png',
                labelText: 'Salinity (ppt)',
                hintText: 'Enter salinity in ppt',
                keyboardType: TextInputType.number,
                controller: controller.salinityController,
              ),
              Spacing.height16,
              AppTextField(
                leadingIcon: 'assets/icons/ic_transparency.png',
                labelText: 'Transparency (ft)',
                hintText: 'Enter transparency in ft',
                keyboardType: TextInputType.number,
                controller: controller.transparencyController,
              ),
              Spacing.height16,
              AppTextField(
                leadingIcon: 'assets/icons/ic_oxygen.png',
                labelText: 'Oxygen (mg/L)',
                hintText: 'Enter oxygen in mg/L',
                keyboardType: TextInputType.number,
                controller: controller.oxygenController,
              ),
              Spacing.height16,
              AppTextField(
                leadingIcon: 'assets/icons/ic_ph.png',
                labelText: 'PH',
                hintText: 'Enter PH value',
                keyboardType: TextInputType.number,
                controller: controller.phController,
              ),
              Spacing.height32,
              AppButton(
                title: "Submit",
                onPressed: controller.submitData
              )
            ],
          ),
        ),
      )
    );
  }
}
