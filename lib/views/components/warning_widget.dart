import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class WarningWidget extends StatelessWidget {
  final String text;
  const WarningWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.warningColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        text
      ),
    );
  }
}
