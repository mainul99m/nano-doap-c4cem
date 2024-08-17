import 'package:flutter/material.dart';
import 'package:nano_doap_c4cem/controllers/fish_data_input_screen_controller.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/app_text_field.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/views/components/fish_name_selector.dart';

class FishDataInputScreen extends StatelessWidget {
  final FishDataInputScreenController controller = Get.put(FishDataInputScreenController());
  FishDataInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Fish Data Input'
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              FishNameSelector(),
              const SizedBox(height: 16,),
              AppTextField(
                leadingIcon: 'assets/icons/ic_scale.png',
                labelText: 'Weight (Kg)',
                hintText: 'Enter weight',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16,),
              AppTextField(
                leadingIcon: 'assets/icons/ic_tape.png',
                labelText: 'Length (inch)',
                hintText: 'Enter length',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16,),
              AppTextField(
                leadingIcon: 'assets/icons/ic_clock.png',
                labelText: 'Fishing Time',
                hintText: 'Enter fishing time',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        )

      ),
    );
  }
}
