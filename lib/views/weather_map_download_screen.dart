import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/controllers/weather_map_screen_controller.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/app_button.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';
import 'package:nano_doap_c4cem/views/stylesheets/padding_stylesheet.dart';
import 'package:nano_doap_c4cem/views/stylesheets/spacing_style.dart';

class WeatherMapDownloadScreen extends StatelessWidget {
  final WeatherMapScreenController controller = Get.put(WeatherMapScreenController());
  WeatherMapDownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Weather Map Screen"),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: PaddingStyle.all16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                padding: PaddingStyle.all24,
                decoration: BoxDecoration(
                  color: AppColors.secondaryBrightColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Image.asset(
                  'assets/icons/ic_weather.png',
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Spacing.height16,
              Container(
                width: double.infinity,
                height: 100,
                padding: PaddingStyle.all8,
                child: Column(
                  children: [
                    Text(
                      "Last updated: 29.09.2024"
                    ),
                    Text(
                      "Last available date: 29.09.2024"
                    ),
                    Text(
                      "Weather Note: It's a sunny day"
                    )
                  ],
                ),
              ),
              Spacing.height16,
              AppButton(
                title: "Update Map",
              ),
              Spacing.height16,
              AppButton(
                onPressed: controller.showMapBtnClicked,
                title: "Shaw Last Map",
              ),
            ],
          ),
        ),
      )
    );
  }
}
