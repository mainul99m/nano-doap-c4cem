import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nano_doap_c4cem/controllers/fish_data_input_screen_controller.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/app_button.dart';
import 'package:nano_doap_c4cem/views/components/app_text_field.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/views/components/fish_name_selector.dart';
import 'package:nano_doap_c4cem/views/stylesheets/text_stylesheets.dart';

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
      body: Stack(
        children: [
          PageView(
            onPageChanged: controller.currentPageIndex,
            children: [
              _photo_input_section(),
              _data_input_section()
            ],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Obx(()=>DotsIndicator(
              dotsCount: 2,
              position: controller.currentPageIndex.value,
              decorator: DotsDecorator(
                color: AppColors.secondaryColor,
                activeColor: AppColors.primaryColor
              ),
            )),
          )
        ],
      )
    );
  }

  Widget _photo_input_section(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Take a photo of the fish',
          style: TextStyleSheets.subtitle,
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: controller.cameraButtonPressed,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.secondaryBrightColor,
                borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Image.asset(
                'assets/icons/ic_camera.png',
                width: 100,
                height: 110,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _data_input_section(){
    return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(()=>FishNameSelector(
                selectedFish: controller.selectedFish.value == "" ? null : controller.selectedFish.value,
                onTap: controller.selectFishTFPressed,
              )),
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
              const SizedBox(height: 16,),
              AppButton(
                title: 'Submit',
                onPressed: (){},
              )
            ],
          ),
        )

    );
  }
}
