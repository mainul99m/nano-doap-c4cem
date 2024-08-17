import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/services/location_services.dart';
import 'package:nano_doap_c4cem/views/fish_data_input_screen.dart';

class HomeScreenController extends GetxController {
  var isLocationServiceEnabled = true.obs;
  var isSyncing = false.obs;
  var isLoactionServiceEnabled = false.obs;
  Position? currentLocation;


  @override
  void onInit() {
    super.onInit();
    isLocationServiceEnabled.value = false;
    requestLocationService();
  }

  void requestLocationService() async{
    var currentLocation = await LocationService.getCurrentLocation();
    if(currentLocation != null){
      isLocationServiceEnabled.value = true;
    }
  }

  void fishInformationBtnClicked() {
    Get.to(()=> FishDataInputScreen());
  }
  void environmentBtnClicked() {

  }
  void planktonBtnClicked() {

  }
  void plasticBtnClicked() {

  }
  void resourcesBtnClicked() {

  }
  void weatherBtnClicked() {

  }
  void seaStateBtnClicked() {

  }

}