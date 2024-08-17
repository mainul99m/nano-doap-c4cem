import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class FishNameSelector extends StatelessWidget {
  final String? selectedFish;
  final GestureTapCallback? onTap;
  const FishNameSelector({
    this.selectedFish,
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryBrightColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/icons/ic_amount.png',
            color: AppColors.secondaryColor,
            height: 50,
            width: 50,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
                padding: EdgeInsets.only(right: 5),
                width: Get.width * 0.6,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: AppColors.primaryColor
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Text(
                    selectedFish == null ? 'Select Fish' : selectedFish!,
                    style: TextStyle(
                        color: selectedFish == null ? Colors.blueGrey : AppColors.secondaryColor,
                        fontSize: 16
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
