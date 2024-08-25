import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/stylesheets/spacing_style.dart';


class ImageCaptureWidget extends StatelessWidget {
  final String imagePath;
  final Function() onCameraButtonPressed;
  const ImageCaptureWidget({
    required this.imagePath,
    required this.onCameraButtonPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: imagePath.isNotEmpty,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              File(imagePath),
              height: Get.height * 0.35,
            ),
          )
        ),
        Spacing.height16,
        InkWell(
          onTap: onCameraButtonPressed,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.secondaryBrightColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: imagePath.isNotEmpty ? EdgeInsets.all(8) : EdgeInsets.all(16),
              child: Image.asset(
                'assets/icons/ic_camera.png',
                width: imagePath.isNotEmpty ?  50:100,
                height: imagePath.isNotEmpty ? 55:110,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
