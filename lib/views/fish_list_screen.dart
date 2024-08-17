import 'package:flutter/material.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';
import 'package:nano_doap_c4cem/views/stylesheets/text_stylesheets.dart';
import 'package:get/get.dart';
import '../controllers/fish_list_controller.dart';

class FishListScreen extends StatelessWidget {
  final FishListController controller = Get.put(FishListController());
  FishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Fish List',
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search bar
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondaryBrightColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.secondaryColor,
                      size: 50,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.green,
                          hintText: 'Search Fish',
                          border: InputBorder.none
                        ),
                        onChanged: (value){
                          controller.searchFish(value);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Obx(()=>ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.searchResultFishList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      controller.selectFishClicked(controller.searchResultFishList[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.primaryColor
                          )
                        )
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              controller.searchResultFishList[index],
                              style: TextStyleSheets.list,
                            ),
                          )
                        ],
                      ),
                    )
                  );
                },
              ))
            ],
          ),
        ),
      )
    );
  }
}
