import 'package:get/get.dart';
import 'package:nano_doap_c4cem/utils/fish_data.dart';

class FishListController extends GetxController {

  var searchResultFishList = List<String>.empty().obs;
  var searchString = "".obs;

  late List<String> all_fish = [];




  @override
  void onInit() {
    super.onInit();
    app_fish_list.forEach((fish) {
      all_fish.add(fish.getLocalName());
    });
    searchResultFishList.value = all_fish;
  }


  void searchFish(String query) {
    searchResultFishList.value = all_fish.where((fish) => fish.toLowerCase().contains(query.toLowerCase())).toList();
    searchString.value = query;
  }

  void selectFishClicked(String fishName){
    print('Fish Selected: $fishName');
    Get.back(result: fishName);
  }

  void addFishClicked(){
    Get.back(result: searchString.value);
  }
}