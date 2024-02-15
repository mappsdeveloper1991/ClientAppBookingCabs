import 'package:bookingcab_mobileapp/view/AppStyle/AppTheme.dart';
import 'package:bookingcab_mobileapp/view/dashboard/DashBoardPage.dart';
import 'package:bookingcab_mobileapp/view/language/LanguageSelectionScreen.dart';
import 'package:bookingcab_mobileapp/view/splash/SplashScreen.dart';
import 'package:flutter/material.dart';


void main() {
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
          '/splash': (context) =>  SplashScreen(),
          '/lang': (context) => const LanguageSelectScreen(),
          '/home': (context) => const HomeScreen(),
        });
  }
}
