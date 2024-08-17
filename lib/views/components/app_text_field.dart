import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String leadingIcon;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final Color? color;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    required this.leadingIcon,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.onChanged,
    this.color,
    this.inputFormatters,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    var primaryInputBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.primaryColor
        )
    );

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
              leadingIcon,
              color: AppColors.secondaryColor,
              height: 50,
              width: 50,
            ),
            Container(
              padding: EdgeInsets.only(right: 5),
              width: Get.width * 0.6,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  enabledBorder: primaryInputBorder,
                  border: primaryInputBorder,
                  disabledBorder: primaryInputBorder,
                  focusedBorder: primaryInputBorder,
                  labelText: labelText,
                  hintText: hintText,
                ),
              ),
            )
          ]
      ),
    );
  }
}
