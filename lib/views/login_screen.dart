import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/controllers/login_screen_controller.dart';
import 'package:nano_doap_c4cem/utils/app_colors.dart';
import 'package:nano_doap_c4cem/views/components/app_button.dart';
import 'package:nano_doap_c4cem/views/components/app_text_field.dart';
import 'package:nano_doap_c4cem/views/stylesheets/padding_stylesheet.dart';
import 'package:nano_doap_c4cem/views/stylesheets/spacing_style.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenController controller = Get.put(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: PaddingStyle.all32,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/common/logo_t.png', fit: BoxFit.contain, height: 120, width: 120),
              Spacing.height32,
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: AppColors.secondaryBrightColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
                )
              ),
              Spacing.height16,
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  fillColor: AppColors.secondaryBrightColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
                ),
                obscureText: true,
              ),
              Spacing.height16,
              Obx(()=>AppButton(
                title: "Login",
                isLoading: controller.isBusy.value,
                onPressed: controller.loginBtnClicked,
              )),
              Spacing.height8,
              InkWell(
                onTap: (){},
                child: Text(
                  "Create Account / Forgot Password",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
