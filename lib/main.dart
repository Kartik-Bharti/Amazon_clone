import 'package:amazon/route.dart';
import 'package:flutter/material.dart';
import 'package:amazon/constants/gobal_variables.dart';
import 'package:amazon/authentication/Screens/auth_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Title
      title: "Amazon",

      // Theme
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),

      // route
      onGenerateRoute: (setting) => generateroute(setting),

      // Scaffold
      home: const AuthScreen(),
    );
  }
}
