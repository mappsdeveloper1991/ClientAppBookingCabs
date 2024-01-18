import 'package:bookingcab_mobileapp/src/home/home_screen.dart';
import 'package:bookingcab_mobileapp/src/auth/language_select_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/lang',
        routes: {
          '/': (context) => const HomeScreen(),
          '/lang': (context) => const LanguageSelectScreen(),
        });
  }
}
