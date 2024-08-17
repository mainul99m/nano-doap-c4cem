import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../stylesheets/text_stylesheets.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  const AppButton({
    this.onPressed,
    required this.title,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
            )
        ),
        onPressed: onPressed,
        child: Container(
            width: 160,
            height: 44,
            child: Center(
                child: Text(
                  title,
                  style: TextStyleSheets.button,
                ))
        )
    );
  }
}
