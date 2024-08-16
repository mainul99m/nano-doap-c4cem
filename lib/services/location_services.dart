import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../utils/custom_message.dart';

class LocationService{
  static Future<Position?> getCurrentLocation() async{
    print('getCurrentLocation called');
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      Get.defaultDialog(
        title: 'Location Service Disabled',
        middleText: 'Please enable location services to continue',
        textConfirm: 'Open Settings',
        onConfirm: () async{
          await Geolocator.openLocationSettings();
          Get.back();
        },
      );
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.deniedForever){
        CustomMessage.showErrorMessage(
            title: 'Location Service Denied',
            message: 'Location permissions are permanently denied, we cannot request permissions.'
        );
      }
      if(permission == LocationPermission.denied){
        CustomMessage.showErrorMessage(
            title: 'Location Service Denied',
            message: 'Location permissions are denied, we cannot request permissions.'
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      CustomMessage.showErrorMessage(
          title: 'Location Service Denied',
          message: 'Location permissions are permanently denied, we cannot request permissions.'
      );
      return null;
    }

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 50,
    );

    return await Geolocator.getCurrentPosition(locationSettings: locationSettings);
  }
}