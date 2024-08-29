import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapsforge_flutter/core.dart';
import 'package:nano_doap_c4cem/controllers/weather_map_screen_controller.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';

class WeatherMapScreen extends StatelessWidget {
  final WeatherMapScreenController controller = Get.find<WeatherMapScreenController>();
  WeatherMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Weather Map"),
      body: MapviewWidget(
          displayModel: controller.displayModel,
          createMapModel: controller.createMapModel,
          createViewModel: controller.createViewModel
      ),
    );
  }
}
