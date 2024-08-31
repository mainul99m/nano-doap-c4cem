import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nano_doap_c4cem/main.dart';
import 'package:nano_doap_c4cem/services/location_services.dart';
import 'package:nano_doap_c4cem/utils/shared_prefs_constants.dart';
import 'package:nano_doap_c4cem/views/environment_data_input_screen.dart';
import 'package:nano_doap_c4cem/views/fish_data_input_screen.dart';
import 'package:nano_doap_c4cem/views/plastic_data_input_screen.dart';
import 'package:nano_doap_c4cem/views/resource_data_input_screen.dart';
import 'package:nano_doap_c4cem/views/weather_map_download_screen.dart';
import '../views/login_screen.dart';
import '../views/plankton_data_input_screen.dart';

class HomeScreenController extends GetxController {
  var isLocationServiceEnabled = true.obs;
  var isSyncing = false.obs;
  var isLoactionServiceEnabled = false.obs;
  var fishCount = 0.obs;
  var environmentCount = 0.obs;
  var planktonCount = 0.obs;
  var plasticCount = 0.obs;
  var resourceCount = 0.obs;

  Position? currentLocation;

  // Hive box
  final _fishBox = Hive.box(SharedPrefsConstants.FISH_BOX);
  final _environmentBox = Hive.box(SharedPrefsConstants.ENVIRONMENT_BOX);
  final _planktonBox = Hive.box(SharedPrefsConstants.PLANKTON_BOX);
  final _plasticBox = Hive.box(SharedPrefsConstants.PLASTIC_BOX);
  final _resourceBox = Hive.box(SharedPrefsConstants.RESOURCES_BOX);



  @override
  void onInit() {
    super.onInit();
    isLocationServiceEnabled.value = false;
    print(sharedPrefs.getString(SharedPrefsConstants.ACCESS_TOKEN));
    requestLocationService();
    updateRemainingDataCount();
  }

  void updateRemainingDataCount(){
    fishCount.value = _fishBox.length;
    environmentCount.value = _environmentBox.length;
    planktonCount.value = _planktonBox.length;
    plasticCount.value = _plasticBox.length;
    resourceCount.value = _resourceBox.length;
  }

  void requestLocationService() async{
    var currentLocation = await LocationService.getCurrentLocation();
    if(currentLocation != null){
      isLocationServiceEnabled.value = true;
    }
  }


  void logoutBtnClicked() async {
    await sharedPrefs.remove(SharedPrefsConstants.ACCESS_TOKEN);

    Get.offAll(()=>LoginScreen());
  }



  void fishInformationBtnClicked() {
    Get.to(()=> FishDataInputScreen());
  }
  void environmentBtnClicked() {
    Get.to(()=> EnvironmentDataInputScreen());
  }
  void planktonBtnClicked() {
    Get.to(()=> PlanktonDataInputScreen());
  }
  void plasticBtnClicked() {
    Get.to(()=> PlasticDataInputScreen());
  }
  void resourcesBtnClicked() {
    Get.to(()=>ResourceDataInputScreen());
  }
  void weatherBtnClicked() {
    Get.to(()=>WeatherMapDownloadScreen());
  }
  void seaStateBtnClicked() {

  }

}