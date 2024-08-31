import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nano_doap_c4cem/main.dart';
import 'package:nano_doap_c4cem/models/environment_upload_model.dart';
import 'package:nano_doap_c4cem/models/plankton_upload_model.dart';
import 'package:nano_doap_c4cem/models/plastic_upload_model.dart';
import 'package:nano_doap_c4cem/models/resource_upload_model.dart';
import 'package:nano_doap_c4cem/services/image_service.dart';
import 'package:nano_doap_c4cem/services/location_services.dart';
import 'package:nano_doap_c4cem/services/remote_service.dart';
import 'package:nano_doap_c4cem/utils/custom_message.dart';
import 'package:nano_doap_c4cem/utils/shared_prefs_constants.dart';
import 'package:nano_doap_c4cem/views/environment_data_input_screen.dart';
import 'package:nano_doap_c4cem/views/fish_data_input_screen.dart';
import 'package:nano_doap_c4cem/views/plastic_data_input_screen.dart';
import 'package:nano_doap_c4cem/views/resource_data_input_screen.dart';
import 'package:nano_doap_c4cem/views/weather_map_download_screen.dart';
import '../models/fish_upload_model.dart';
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
    syncData();
  }

  void updateRemainingDataCount(){
    fishCount.value = _fishBox.length;
    environmentCount.value = _environmentBox.length;
    planktonCount.value = _planktonBox.length;
    plasticCount.value = _plasticBox.length;
    resourceCount.value = _resourceBox.length;
  }

  void syncData() async{
    if(fishCount.value > 0){
      var isDone = await syncFishData();
      if(isDone){
        print("Fish data sync done");
      }
    }
    if(planktonCount.value > 0){
      var isDone = await syncPlanktonData();
      if(isDone){
        print("Plankton data sync done");
      }
    }
    if(resourceCount.value > 0){
      var isDone = await syncResourceData();
      if(isDone){
        print("Resource data sync done");
      }
    }
    if(plasticCount.value > 0){
      var isDone = await syncPlasticData();
      if(isDone){
        print("Plastic data sync done");
      }
    }
    if(environmentCount.value > 0){
      var isDone = await syncEnvironmentData();
      if(isDone){
        print("Environment data sync done");
      }
    }

  }

  Future<bool> syncFishData() async{
    while(fishCount.value > 0){
      print("syncing fish data");
      var fishDataString = _fishBox.getAt(0);
      var fishData = fishUploadModelFromJson(fishDataString);
      var response = await RemoteService.updateFishData(fish: fishData);
      if(response){
        ImageService.deleteImage(fishData.imageUrl);
        _fishBox.deleteAt(0);
        fishCount.value = _fishBox.length;
      } else{
        print("Fish data sync failed");
        return false;
      }
    }
    CustomMessage.showSuccessMessage(
        title: "Success",
        message: "Fish data sync done"
    );
    return true;
  }

  Future<bool> syncPlanktonData() async{
    while(planktonCount.value > 0){
      print("syncing plankton data");
      var planktonDataString = _planktonBox.getAt(0);
      var planktonData = planktonUploadModelFromJson(planktonDataString);
      var response = await RemoteService.updatePlanktonData(plankton: planktonData);
      if(response){
        ImageService.deleteImage(planktonData.imageUrl);
        _planktonBox.deleteAt(0);
        planktonCount.value = _planktonBox.length;
      } else{
        print("Plankton data sync failed");
        return false;
      }
    }
    CustomMessage.showSuccessMessage(
        title: "Success",
        message: "Plankton data sync done"
    );
    return true;
  }

  Future<bool> syncResourceData() async{
    while(resourceCount.value > 0){
      print("syncing resource data");
      var resourceDataString = _resourceBox.getAt(0);
      var resourceData = resourceUploadModelFromJson(resourceDataString);
      var response = await RemoteService.updateResourceData(resource: resourceData);
      if(response){
        ImageService.deleteImage(resourceData.imageUrl);
        _resourceBox.deleteAt(0);
        resourceCount.value = _resourceBox.length;
      } else{
        print("Resource data sync failed");
        return false;
      }
    }
    CustomMessage.showSuccessMessage(
        title: "Success",
        message: "Resource data sync done"
    );
    return true;
  }

  Future<bool> syncPlasticData() async{
    while(plasticCount.value > 0){
      print("syncing plastic data");
      var plasticDataString = _plasticBox.getAt(0);
      var plasticData = plasticUploadModelFromJson(plasticDataString);
      var response = await RemoteService.updatePlasticData(plastic: plasticData);
      if(response){
        ImageService.deleteImage(plasticData.imageUrl);
        _plasticBox.deleteAt(0);
        plasticCount.value = _plasticBox.length;
      } else{
        print("Plastic data sync failed");
        return false;
      }
    }
    CustomMessage.showSuccessMessage(
        title: "Success",
        message: "Plastic data sync done"
    );
    return true;
  }

  Future<bool> syncEnvironmentData() async{
    while(environmentCount.value > 0){
      print("syncing plastic data");
      var environmentDataString = _environmentBox.getAt(0);
      var environment = environmentUploadModelFromJson(environmentDataString);
      var response = await RemoteService.updateEnvironmentData(environment: environment);
      if(response){
        _environmentBox.deleteAt(0);
        environmentCount.value = _environmentBox.length;
      } else{
        print("Environment data sync failed");
        return false;
      }
    }
    CustomMessage.showSuccessMessage(
        title: "Success",
        message: "Environment data sync done"
    );
    return true;
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



  void fishInformationBtnClicked() async{
    await Get.to(()=> FishDataInputScreen());
    updateRemainingDataCount();
  }
  void environmentBtnClicked() async{
    await Get.to(()=> EnvironmentDataInputScreen());
    updateRemainingDataCount();
  }
  void planktonBtnClicked() async{
    await Get.to(()=> PlanktonDataInputScreen());
    updateRemainingDataCount();
  }
  void plasticBtnClicked() async{
    await Get.to(()=> PlasticDataInputScreen());
    updateRemainingDataCount();
  }
  void resourcesBtnClicked() async{
    await Get.to(()=>ResourceDataInputScreen());
    updateRemainingDataCount();
  }
  void weatherBtnClicked() async{
    await Get.to(()=>WeatherMapDownloadScreen());
    updateRemainingDataCount();
  }
  void seaStateBtnClicked() {

  }

}