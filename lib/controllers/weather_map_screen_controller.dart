import 'package:get/get.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import '../views/weather_map_screen.dart';

class WeatherMapScreenController extends GetxController {

  late MapShapeSource backgroundMapSource;
  late MapZoomPanBehavior zoomPanBehavior;

  @override
  void onInit() {
    backgroundMapSource = MapShapeSource.asset(
      'assets/maps/asia.geo.json',
      shapeDataField: 'name',
    );

    zoomPanBehavior = MapZoomPanBehavior(
      focalLatLng: MapLatLng(22.05467623279185, 90.92649670320951),
      zoomLevel: 30,
      maxZoomLevel: 1000
    );

    super.onInit();
  }

  void showMapBtnClicked() {
    Get.to(() => WeatherMapScreen());
  }

}