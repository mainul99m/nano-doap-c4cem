import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nano_doap_c4cem/utils/languages.dart';
import 'package:nano_doap_c4cem/utils/shared_prefs_constants.dart';
import 'package:nano_doap_c4cem/views/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences sharedPrefs;
late String selectedLanguageCode;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();
  selectedLanguageCode = sharedPrefs.getString('LANGUAGE_CODE') ?? 'en_US';

  await Hive.initFlutter();
  await Hive.openBox(SharedPrefsConstants.FISH_BOX);
  await Hive.openBox(SharedPrefsConstants.ENVIRONMENT_BOX);
  await Hive.openBox(SharedPrefsConstants.PLANKTON_BOX);
  await Hive.openBox(SharedPrefsConstants.PLASTIC_BOX);
  await Hive.openBox(SharedPrefsConstants.RESOURCES_BOX);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nano Doap C4CEM',
      translations: Languages(),
      locale: Locale(selectedLanguageCode.split('_')[0], selectedLanguageCode.split('_')[1]),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

