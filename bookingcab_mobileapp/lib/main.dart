import 'package:bookingcab_mobileapp/data/remoteServer/MyHttpOverrides.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppTheme.dart';
import 'package:bookingcab_mobileapp/view/dashboard/DashBoardPage.dart';
import 'package:bookingcab_mobileapp/view/language/LanguageSelectionScreen.dart';
import 'package:bookingcab_mobileapp/view/splash/SplashScreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  setupHttpOverrides(); // Set up SSL pinning
  //SharedPreferencesUtil.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/lang': (context) => const LanguageSelectScreen(),
          '/home': (context) => const HomeScreen(),
        });
  }
}
