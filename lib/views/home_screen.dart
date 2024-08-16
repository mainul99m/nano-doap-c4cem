import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nano_doap_c4cem/controllers/home_screen_controller.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/custom_appbar.dart';
import 'package:nano_doap_c4cem/views/components/menu_icon_button.dart';
import 'package:nano_doap_c4cem/views/components/section_header.dart';
import 'package:nano_doap_c4cem/views/components/warning_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController controller = Get.put(HomeScreenController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'NANO-DOAP C4CEM'.tr,
        actions: [
          Visibility(
              visible: controller.isSyncing.value,
              child: Row(
                children: [
                  Lottie.asset(
                      'assets/lottie/syncing.json',
                      height: 40
                  ),
                  SizedBox(width: 16,)
                ],
              ),
          ),
          Obx(()=>Visibility(
            visible: !controller.isLocationServiceEnabled.value,
            child: Row(
              children: [
                Icon(
                  Icons.location_disabled,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 16,)
              ],
            ),
          ))
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      drawer: Drawer(
        backgroundColor: AppColors.secondaryBrightColor,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Item 1'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const  Text('Item 2'),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Image.asset('assets/common/logo_nano_doap_white.jpg', fit: BoxFit.contain),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
             Obx(()=>Visibility(
               visible: !controller.isLocationServiceEnabled.value,
               child:const WarningWidget(
                   text: 'This app can not work with location services disabled. Please enable location services to continue.'
               )
             )),
              const SizedBox(height: 20,),
              SectionHeader(title: 'Provide information related to ocean'.tr),
              const SizedBox(height: 20,),
              /// Information Related to Ocean and Environment
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuIconButton(
                    title: 'Information related to fish'.tr,
                    iconPath: 'assets/icons/ic_fish.png',
                    onTap: () {},
                  ),
                  MenuIconButton(
                    title: 'Information related to environment'.tr,
                    iconPath: 'assets/icons/ic_temperature.png',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              /// Information Related to Plankton and Plastic
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuIconButton(
                    title: 'Information related to plankton'.tr,
                    iconPath: 'assets/icons/ic_plankton.png',
                    onTap: () {},
                  ),
                  MenuIconButton(
                    title: 'Information related to plastic'.tr,
                    iconPath: 'assets/icons/ic_water-pollution.png',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              /// Information Related to Resource
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuIconButton(
                    title: 'Information related to resource'.tr,
                    iconPath: 'assets/icons/ic_resource.png',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 26,),
              SectionHeader(title: 'Information for you'.tr),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuIconButton(
                    title: 'Weather map'.tr,
                    iconPath: 'assets/icons/ic_weather.png',
                    onTap: () {},
                  ),
                  MenuIconButton(
                    title: 'Sea state map'.tr,
                    iconPath: 'assets/icons/ic_map.png',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );
  }
}
