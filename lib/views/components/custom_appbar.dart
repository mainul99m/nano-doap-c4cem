import 'package:flutter/material.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const CustomAppbar({
    super.key,
    required this.title,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
      actions: actions,
      backgroundColor: AppColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
