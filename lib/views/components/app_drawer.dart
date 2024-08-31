import 'package:flutter/material.dart';
import 'package:nano_doap_c4cem/views/stylesheets/spacing_style.dart';

import '../../utils/app_colors.dart';

class AppDrawer extends StatelessWidget {
  final String username;
  final String appVersion;
  final GestureTapCallback onLogout;
  const AppDrawer({
    required this.username,
    this.appVersion = '1.0.0',
    required this.onLogout,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.secondaryBrightColor,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/common/logo_t.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: 8,),
                        Text(username, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Text('Version: $appVersion', style: TextStyle(fontSize: 12),)
                      ],
                    ),
                  ),
                ),
                Spacing.height32,
                listMenuItem(
                  title: 'Logout',
                  icon: Icons.logout,
                  onTap: onLogout
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
    );
  }
  Widget listMenuItem({required String title, required IconData icon, required GestureTapCallback onTap}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
        ),
        leading: Icon(
          icon,
          color: AppColors.secondaryColor,
        ),
        onTap:onTap,
      ),
    );
  }
}
