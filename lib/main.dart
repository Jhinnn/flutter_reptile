import 'package:flutter/material.dart';
import 'package:flutter_reptile/constants/app_colors.dart';
import 'package:flutter_reptile/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pub.dev',
      themeMode: ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.goodColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.goodColor,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 22)),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white))),
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all<Color>(Colors.red),
              thumbVisibility: MaterialStateProperty.all<bool>(true))),
      home: const MainScreen(),
    );
  }
}
