import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/controllers/weather_map_screen_controller.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class WeatherMapScreen extends StatelessWidget {
  final WeatherMapScreenController controller = Get.find<WeatherMapScreenController>();
  WeatherMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Weather Map"),
      backgroundColor: AppColors.backgroundColor,
      body: SfMaps(
          layers: [
            MapShapeLayer(
              source: controller.backgroundMapSource,
              zoomPanBehavior: controller.zoomPanBehavior,
              color: Colors.white,
              strokeWidth: 2,
              sublayers: [

              ],
            )
          ]
      )
    );
  }
}
