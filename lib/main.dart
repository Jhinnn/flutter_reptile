import 'package:flutter/material.dart';
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
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
          ),
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all<Color>(Colors.red),
              thumbVisibility: MaterialStateProperty.all<bool>(true))),
      home: const MainScreen(),
    );
  }
}
