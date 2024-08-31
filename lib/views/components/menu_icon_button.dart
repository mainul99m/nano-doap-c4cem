import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class MenuIconButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final GestureTapCallback? onTap;
  final int count;
  const MenuIconButton({
    super.key,
    required this.title,
    required this.iconPath,
    this.count = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.secondaryBrightColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.secondaryBrightColor,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Column(
              children: [
                Image.asset(
                  iconPath,
                  height: Get.width * 0.2,
                  width: Get.width * 0.2,
                ),
                const SizedBox(height: 20,),
                Container(
                  width: Get.width * 0.35,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: count > 0,
            child: Positioned(
                top: 4,
                right: 4,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: AppColors.warningColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
